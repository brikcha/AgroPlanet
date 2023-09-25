<?php

namespace App\Controller;

use App\Entity\Plante;
use App\Entity\PropertySearch;
use App\Form\PlanteType;
use App\Form\PropertySearchType;
use App\Repository\PlanteRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/plante")
 */
class PlanteController extends AbstractController
{
    /**
     * @Route("/", name="plante_index")
     * @param PlanteRepository $planteRepository
     * @param Request $request
     * @return Response
     */
    public function index(PlanteRepository $planteRepository, Request $request): Response
    {

        $propertySearch = new PropertySearch();
        $form = $this->createForm(PropertySearchType::class, $propertySearch);
        $form->handleRequest($request);
        $plantes = $planteRepository->findAll();
        if ($form->isSubmitted() && $form->isValid()) {
            $nom = $propertySearch->getName();
            if ($nom != "")
                $plantes = $planteRepository->findBy(['nom' => $nom]);

        }
        return $this->render('plante/index.html.twig', [
            'form' =>$form->createView(),
            'plantes' => $plantes,
        ]);
    }

    /**
     * @Route("/new", name="plante_new", methods={"GET","POST"})
     * @IsGranted("ROLE_EDITOR")
     */
    public function new(Request $request): Response
    {
        $plante = new Plante();
        $form = $this->createForm(PlanteType::class, $plante);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            /**
             * @var UploadedFile $file
             */
            $file = $form->get('image')->getData();
            $fileName=md5(uniqid()).'.'.$file->guessExtension();
            $file->move(
                $this->getParameter('image_directory'),$fileName
            );
            $plante->setImage($fileName);
            $plante->setDateDeCreation(new \DateTime());
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($plante);
            $entityManager->flush();

            return $this->redirectToRoute('plante_index');
        }

        return $this->render('plante/new.html.twig', [
            'plante' => $plante,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="plante_show", methods={"GET"})
     */
    public function show(Plante $plante): Response
    {
        return $this->render('plante/show.html.twig', [
            'plante' => $plante,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="plante_edit", methods={"GET","POST"})
     * @IsGranted("ROLE_EDITOR")
     */
    public function edit(Request $request, Plante $plante): Response
    {
        $form = $this->createForm(PlanteType::class, $plante);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            /**
             * @var UploadedFile $file
             */
            $file = $form->get('image')->getData();
            $fileName=md5(uniqid()).'.'.$file->guessExtension();
            $file->move(
                $this->getParameter('image_directory'),$fileName
            );
            $plante->setImage($fileName);
            $plante->setDateDeCreation(new \DateTime());
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('plante_index');
        }

        return $this->render('plante/edit.html.twig', [
            'plante' => $plante,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="plante_delete", methods={"POST"})
     * @IsGranted("ROLE_EDITOR")
     * @param Request $request
     * @param Plante $plante
     * @return Response
     */
    public function delete(Request $request, Plante $plante): Response
    {
        if ($this->isCsrfTokenValid('delete'.$plante->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($plante);
            $entityManager->flush();
        }

        return $this->redirectToRoute('plante_index');
    }
}

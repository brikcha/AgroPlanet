<?php

namespace App\Controller;

use App\Entity\Maladie;
use App\Entity\PropertySearch;
use App\Form\MaladieType;
use App\Form\PropertySearchType;
use App\Repository\MaladieRepository;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/maladie")
 */
class MaladieController extends AbstractController
{
    /**
     * @Route("/", name="maladie_index")
     * @param MaladieRepository $maladieRepository
     * @param Request $request
     * @return Response
     */
    public function index(MaladieRepository $maladieRepository, Request $request): Response
    {
        $propertySearch = new PropertySearch();
        $form = $this->createForm(PropertySearchType::class, $propertySearch);
        $form->handleRequest($request);
        $maladies = $maladieRepository->findAll();
        if ($form->isSubmitted() && $form->isValid()) {
            $nom = $propertySearch->getName();
            if ($nom != "")
                $maladies = $maladieRepository->findBy(['nom' => $nom]);

        }
        return $this->render('maladie/index.html.twig', [
            'form' =>$form->createView(),
            'maladies' => $maladies,
        ]);
    }

    /**
     * @Route("/new", name="maladie_new", methods={"GET","POST"})
     * @IsGranted("ROLE_EDITOR")
     */
    public function new(Request $request): Response
    {
        $maladie = new Maladie();
        $form = $this->createForm(MaladieType::class, $maladie);
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
            $maladie->setImage($fileName);
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($maladie);
            $entityManager->flush();

            return $this->redirectToRoute('maladie_index');
        }

        return $this->render('maladie/new.html.twig', [
            'maladie' => $maladie,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="maladie_show", methods={"GET"})
     */
    public function show(Maladie $maladie): Response
    {
        return $this->render('maladie/show.html.twig', [
            'maladie' => $maladie,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="maladie_edit", methods={"GET","POST"})
     * @IsGranted("ROLE_EDITOR")
     */
    public function edit(Request $request, Maladie $maladie): Response
    {
        $form = $this->createForm(MaladieType::class, $maladie);
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
            $maladie->setImage($fileName);
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('maladie_index');
        }

        return $this->render('maladie/edit.html.twig', [
            'maladie' => $maladie,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="maladie_delete", methods={"POST"})
     * @IsGranted("ROLE_EDITOR")
     */
    public function delete(Request $request, Maladie $maladie): Response
    {
        if ($this->isCsrfTokenValid('delete' . $maladie->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($maladie);
            $entityManager->flush();
        }

        return $this->redirectToRoute('maladie_index');
    }
}

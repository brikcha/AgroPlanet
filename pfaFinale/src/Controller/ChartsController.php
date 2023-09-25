<?php

namespace App\Controller;

use App\Repository\MaladieRepository;
use App\Repository\PlanteRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ChartsController extends AbstractController
{
    /**
     * @Route("/charts", name="charts")
     */
    public function index(): Response
    {
        return $this->render('charts/index.html.twig', [
            'controller_name' => 'ChartsController',
        ]);
    }

    /**
     * @Route("/stats", name="stats")
     * @param MaladieRepository $maladieRepository
     * @param PlanteRepository $planteRepository
     * @return Response
     */
    public function statistiques(MaladieRepository $maladieRepository, PlanteRepository $planteRepository): Response
    {
        // on va chercher toutes les maladies
        $maladies = $maladieRepository->findAll();
        $plantes = $planteRepository->countByDate();

        $maladieNom = [];
        $maladieColor = [];
        $maladieCount = [];

//        {
//            maladieNom = [
//                'maladie1',
//                'maladie2',
//                'maladie3',
//            ],
//            maladieColor = [
//                'red',
//                'green',
//                'black',
//            ],
//            maladieCount = [
//                '2',
//                '3',
//                '4',
//            ]
//        }

        foreach ($maladies as $maladie) {
            $maladieNom[] = $maladie->getNom();
            $maladieColor[] = $maladie->getColeur();
            $maladieCount[] = count($maladie->getPlantes());
        }

        $dates = [];
        $plantesCount = [];
        foreach ($plantes as $plante) {
            $dates[] = $plante['dateDeCreation'];
            $plantesCount[] = $plante['count'];
        }

        return $this->render('charts/charts.html.twig', [
            'maladieNom' => json_encode($maladieNom),
            'maladieColor' => json_encode($maladieColor),
            'maladieCount' => json_encode($maladieCount),

            'dates' => json_encode($dates),
            'plantesCount' => json_encode($plantesCount),
        ]);
//        return $this->render('charts/index.html.twig', [
//            'controller_name' => 'ChartsController',
//        ]);
    }
}

<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class WelcomePageController extends AbstractController
{
    #[Route('/welcome_page', name: 'app_welcome_page')]
    public function index(): Response
    {
        return $this->render('welcome_page/index.html.twig', [
            'controller_name' => 'WelcomePageController',
        ]);
    }
}

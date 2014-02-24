<?php

namespace coaching\siteBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class CoachingController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('coachingBundle:coaching:index.html.twig', array('name' => $name));
    }
}

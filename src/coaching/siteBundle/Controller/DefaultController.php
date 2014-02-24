<?php

namespace coaching\siteBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('coachingBundle:Default:index.html.twig', array('name' => $name));
    }
}

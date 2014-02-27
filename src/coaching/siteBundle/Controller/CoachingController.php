<?php

namespace coaching\siteBundle\Controller;

use coaching\siteBundle\Entity\Sportif;
use coaching\siteBundle\Entity\User;
use coaching\siteBundle\Entity\Coach;
use coaching\siteBundle\Entity\Training; 

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class CoachingController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('coachingBundle:coaching:index.html.twig', array('name' => $name));
    }
    public function accueilAction()
    {
        return $this->render('coachingBundle:coaching:accueil.html.twig');
    }
    public function sportifAction()
    {
    	$user = $this->container->get('security.context')->getToken()->getUser();

        $doctrine=$this->getDoctrine();
        $manager=$doctrine->getManager();
        $repository=$manager->getRepository("coachingBundle:User");
        
            

        
        if($user!='anon.')
        {
            $temp=$repository->find($user->getId());
            $repository=$manager->getRepository("coachingBundle:Sportif");
            $deja=$repository->findByuser($user->getId());
            
            if(empty($deja))
            {
        	$sportif=new Sportif();
        	
        	$formBuilder = $this->createFormBuilder($sportif);
        	
        	$formBuilder
        		->add('taille','integer')
        		->add('poids','number')
        		->add('sexe','choice', array('choices' =>array('0'=>'Masculin','1'=>'Féminin'),'expanded' => 'true','data' => '0'))
        		->add('date_naissance','birthday',array('format'=>'d/M/y'))
        		->add('niveau','choice', array('choices' =>array('Débutant'=>'Debutant','Intermédiaire'=>'Intermediaire', 'Avancé'=>'Avancé','Professionnel'=>'Professionnel'),'expanded'=>'false'))
                ->add('training','entity',array('class'=>'coaching\siteBundle\Entity\Training','property'=>'type'));

        	$form = $formBuilder->getForm();

        	$request = $this->get('request');

        	if ($request->getMethod() == 'POST')
             {
                $form->bind($request); 

                if ($form->isValid())
                {
                	$sportif->setUser($temp);
                    $em = $this->getDoctrine()->getManager();
                    $em->persist($sportif);
                    $em->flush(); 

                   
                }
             }
                return $this->render('coachingBundle:coaching:sportif.html.twig', array('form'=> $form->createView()));
            }
            else
            {
                
                
            

                return $this->render('coachingBundle:coaching:sportif2.html.twig', array('sportif'=>$deja[0],'user'=>$user));
            }
        }
        else
        {
           return $this->render('coachingBundle:coaching:wrong.html.twig'); 
        }
    }
    public function coachAction()
    {
        $user = $this->container->get('security.context')->getToken()->getUser();

        $doctrine=$this->getDoctrine();
        $manager=$doctrine->getManager();
        $repository=$manager->getRepository("coachingBundle:User");
        
        if($user!='anon.')
        {
           $temp=$repository->find($user->getId());

           $coach=new Coach();

           $formBuilder = $this->createFormBuilder($coach);
            
            $formBuilder
                ->add('tarif','number')
                ->add('sexe','choice', array('choices' =>array('0'=>'Masculin','1'=>'Féminin'),'expanded' => 'true','data' => '0'));
                

            $form = $formBuilder->getForm();

            $request = $this->get('request');

            if ($request->getMethod() == 'POST')
             {
                $form->bind($request); 

                if ($form->isValid())
                {
                    $coach->setUser($temp);
                    $em = $this->getDoctrine()->getManager();
                    $em->persist($coach);
                    $em->flush(); 

                   
                }
             }

           return $this->render('coachingBundle:coaching:coach.html.twig', array('form'=> $form->createView()));
        }
        else
        {
           return $this->render('coachingBundle:coaching:wrong.html.twig'); 
        }
    }
    public function forumAction()
    {
        return $this->render('coachingBundle:coaching:forum.html.twig', array());
    }
    public function boutiqueAction()
    {
        return $this->render('coachingBundle:coaching:boutique.html.twig', array());
    }

    public function sportifModifAction()
    {
        $user = $this->container->get('security.context')->getToken()->getUser();

        $doctrine=$this->getDoctrine();
        $manager=$doctrine->getManager();
        $repository=$manager->getRepository("coachingBundle:User");
        
            

        
        
            $temp=$repository->find($user->getId());
            $repository=$manager->getRepository("coachingBundle:Sportif");
            $deja=$repository->findByuser($user->getId());
           // echo "<pre>".print_r($deja,true)."</pre>";
            //$sportif=new Sportif();
            
            $formBuilder = $this->createFormBuilder($deja);
            if($deja[0]->getSexe()=='Masculin')
                $sexe=1;
            else
                $sexe=0;
            echo $deja[0]->getDateNaissance()->format('d/M/Y');
            $formBuilder
                ->add('taille','integer',array('data' => $deja[0]->getTaille()))
                ->add('poids','number',array('data' => $deja[0]->getPoids()))
                ->add('sexe','choice', array('choices' =>array('0'=>'Masculin','1'=>'Féminin'),'expanded' => 'true','data' => $sexe))
                ->add('date_naissance','birthday',array('format'=>'d/M/y'),array('data'=>$deja[0]->getDateNaissance()))
                ->add('niveau','choice', array('choices' =>array('Débutant'=>'Debutant','Intermédiaire'=>'Intermediaire', 'Avancé'=>'Avancé','Professionnel'=>'Professionnel'),'expanded'=>'false','data'=> $deja[0]->getNiveau()))
                ->add('training','entity',array('class'=>'coaching\siteBundle\Entity\Training','property'=> 'type','preferred_choices'=>array($deja[0]->getTraining())));

            $form = $formBuilder->getForm();

            $request = $this->get('request');

            if ($request->getMethod() == 'POST')
             {
                $form->bind($request); 

                if ($form->isValid())
                {
                    $deja[0]->setUser($temp);
                    //echo "<pre>".print_r($deja[0],true)."</pre>";
                    $em = $this->getDoctrine()->getManager();
                    $em->persist($deja[0]);
                    $em->flush(); 

                   
                }

                
             }
            
        return $this->render('coachingBundle:coaching:sportif_modif.html.twig', array('form'=> $form->createView()));

       
    }

    public function sportifSupprAction()
    {
        return $this->render('coachingBundle:coaching:sportif_suppr.html.twig', array());
    }
}

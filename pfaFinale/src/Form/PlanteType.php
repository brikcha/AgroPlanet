<?php

namespace App\Form;

use App\Entity\Categorie;
use App\Entity\Maladie;
use App\Entity\Plante;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PlanteType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        
        $builder
            ->add('nom')
            ->add('description')
            ->add('historique')
            ->add('ville')
//            ->add('dateDeCreation')
            ->add('position')
//            ->add('image')
            ->add('image', FileType::class, [
                'label' => 'insert image',
                'data_class' => null
            ])
            ->add('categorie', EntityType::class, [
                'class' => Categorie::class,
                'label' => 'categorie',
                'choice_label' => 'nom'
            ])
            ->add('maladie', EntityType::class, [
                'class' => Maladie::class,
                'label' => 'maladie',
                'choice_label' => 'nom'
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Plante::class,
        ]);
    }
}

<?php

namespace ApiBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerAwareTrait;
use WyndApi\WyndApiCoreBundle\Entity\ApiUser;

class LoadUserData implements FixtureInterface, ContainerAwareInterface
{
    use ContainerAwareTrait;

    public function load(ObjectManager $manager)
    {
        $encoder = $this->container->get('security.password_encoder');

        $admin = new ApiUser();
        $admin->setUsername('admin_api');
        $admin->setPassword($encoder->encodePassword($admin, 'admin_api'));
        $admin->setSecret('secret');
        $admin->setRoles([
            'ROLE_USER',
            'ROLE_ADMIN',
        ]);
        $admin->setEmail('admin@localhost');
        $manager->persist($admin);

        $user = new ApiUser();
        $user->setUsername('user_api');
        $user->setPassword($encoder->encodePassword($user, 'user'));
        $user->setSecret('secret');
        $user->setRoles([
            'ROLE_USER',
        ]);
        $user->setEmail('admin@localhost');
        $manager->persist($user);

        $manager->flush();
    }
}

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BDE3C9716
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 06:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF34B898C4;
	Thu, 15 Jul 2021 04:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F11C898C0;
 Thu, 15 Jul 2021 04:19:01 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GQLjF0pMPz9s5R;
 Thu, 15 Jul 2021 14:18:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1626322739;
 bh=ex0MUn6/WmQdAE7HtUlusnPU0W5GbK7HPP3ssZenvDE=;
 h=Date:From:To:Cc:Subject:From;
 b=og4lTkZCqU8uhEcrlj5fFWSceidXb7iKkWHri3bwa80OENvKAeNbh8JX/x7j8ql0e
 oCRXfWpdYUgML0Jkuy5HaEUfq4yMcggTcDJD52ZTOmfXhrl3LusFJjbDYyr6+sxm+8
 3HyQv8lwSy+vg3hGQZJ9r2U2GPdZZ/jDl9ZJqtD8PUbobFTe0XyysUYguo281xHEGs
 lAGPTn1/uwQKIxv1CvhT4j8hDZ1SC6bID6B28LjDiFtxjqqar+u1RlzTgPJXDoKSaB
 0kYghkpbSc10roAxLMBqOTHNfkymyS9ZHQceIR4V+67L4yHawmu1vIgg9gfC60kASU
 sigdOO3BGnUcg==
Date: Thu, 15 Jul 2021 14:18:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: Signed-off-by missing for commit in the drm-intel tree
Message-ID: <20210715141854.1ad4a956@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jx/Vz4=uZrGLV5ZV0Zhtu/8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/jx/Vz4=uZrGLV5ZV0Zhtu/8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  db47fe727e1f ("drm/i915/step: s/<platform>_revid_tbl/<platform>_revids")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/jx/Vz4=uZrGLV5ZV0Zhtu/8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDvty4ACgkQAVBC80lX
0GxAUAf7BPNk+ONP5YbLLVNb9P+FIKUQhhDCy9Lt+5WNh5CSH6XlJVskjHkFK4gy
yjlQ6GHz/xEAJ1CWOWJu1flHPjWwC+1fPiNrG4J1dTF7EYNkGePqilBf4SrzGXTw
sgiTV21wv3/GdCKKGLva42WfKKEMIc1ayOIDvzIRRG3WpRuJXm1hCJ2mqYFuRFxZ
ogNQX+f8zBoeHy8O+VEgSL8KNtmWz6KcHwVmPG38TIWdidZJPK1r+nbWYlOfpg22
Wag3rLxylNsQgLFiJg1bka8akakatHLwz5ltJf3HmlotTROPum5wRtbwZ/zQl1Y8
GWS6xAwUrP5RXx5f8FCibRCq0jwEKw==
=/pQk
-----END PGP SIGNATURE-----

--Sig_/jx/Vz4=uZrGLV5ZV0Zhtu/8--

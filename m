Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321EC581F8F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 07:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7393FC0CCD;
	Wed, 27 Jul 2022 05:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCD7C0107;
 Wed, 27 Jul 2022 05:37:57 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lt2cH20g5z4x1c;
 Wed, 27 Jul 2022 15:37:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1658900273;
 bh=W3BFpgevI9hLcOGPoOT8iHlLjNtq9ZecOiT6kd2h8bI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eTqkhS89cg8Tb9+To9uVlXiHlFRSHxdacs+912olxZpinxRr9sL3tsFtdqv/hb9lK
 4Lvz9/70rw1zxzZYYmC9Hq1RfM5ps29xKbjurs2fNKERB4HjuqtAHH+6WIBZZYPbUn
 sgM/RZF9i9IveeVarGP8IEacABrYiADk/ffOMzYnwVQyLNrvAokyMzB7rm0cGI0Juw
 EiYKsvl234v42wTnz+Zkumgte/3IwcqZ5EI958muudCOt7As08xVLDXoQOVzCkP/Xt
 yWs21YdjhPiRJPUyE6MIo5UclYSQY6kb3AJSMMkes+JafAOq1WoPHAS6+zost3/oLo
 t0U6VuMQmSH1A==
Date: Wed, 27 Jul 2022 15:37:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-misc-fixes tree
Message-ID: <20220727153750.00b4c033@canb.auug.org.au>
In-Reply-To: <CAPM=9txm_fZX781zMr0RAS6uBD_FoE63THY-WaiB92xYEUrfTw@mail.gmail.com>
References: <20220711124742.3b151992@canb.auug.org.au>
 <6e60d396-2a52-d1fa-f125-3c585605b531@amd.com>
 <20220718094453.2f1a1f09@canb.auug.org.au>
 <20220727125508.1991f1e7@canb.auug.org.au>
 <CAPM=9txm_fZX781zMr0RAS6uBD_FoE63THY-WaiB92xYEUrfTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S+Jm_JAtWS4ZEjqD.3eEMr9";
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/S+Jm_JAtWS4ZEjqD.3eEMr9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, 27 Jul 2022 13:24:45 +1000 Dave Airlie <airlied@gmail.com> wrote:
>
> My assumption is I fix this on sending my -next tree to Linus with a
> resolution I create at that time?
>=20
> Is there another option, we have this fixed in out drm-tip tree already.

Sounds good, no problem.

--=20
Cheers,
Stephen Rothwell

--Sig_/S+Jm_JAtWS4ZEjqD.3eEMr9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmLgzy4ACgkQAVBC80lX
0GwaSQgAgZHYGWcrMOkXIpee3BWW88sbFXX885guSGckGym/Fn3A75LulEe1d5Bc
AeN5J6E+q7Sg3ihlTiW6wFdht8EDueyiwfXd+joQkEAgwtGuzr1M95mwckSNPPUs
/W/Fy2iKEjHX+fc+9jG/3sG6t7+F3x0yx+ofDJ9Yl26ZqxvfOz8Rjb4SHVCwj7At
571zQEZNFOBCPTWrEosO6uLRRE8REPt5fddCwnro63vGaXpuflbyCLsn87DiQkH4
PkiuJ/J/ErU4QCVcMWeX+tsuH48K+Opbb5atBTFKjz1ETcsARi9iOw0fRnxMSxVk
13edLDdDrf+zktsMlX5fw3p8K08FUA==
=50DY
-----END PGP SIGNATURE-----

--Sig_/S+Jm_JAtWS4ZEjqD.3eEMr9--

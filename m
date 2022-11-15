Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60C8629130
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 05:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BD710E098;
	Tue, 15 Nov 2022 04:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 416 seconds by postgrey-1.36 at gabe;
 Tue, 15 Nov 2022 04:26:39 UTC
Received: from gimli.rothwell.id.au (unknown
 [IPv6:2404:9400:2:0:216:3eff:fee1:997a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697AC10E098
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 04:26:39 +0000 (UTC)
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.rothwell.id.au (Postfix) with ESMTPSA id 4NBCcc3yWMzyd4;
 Tue, 15 Nov 2022 15:19:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
 s=201702; t=1668485976;
 bh=WCTKp8Xs0QIhqszeKT0YqUW0vwpBo7lu0Js3SFewlO4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nofVWjcaAu335G8mYDQ1SwJGLh/3Vj526WBZAgTI3WySpBXwC/IR9IiWFY41ByCzC
 Dg8H5VDHN8cJN5r6EA4T+0GbWVvcea+eytk6+wGCPlKOBaLm/yBmfCgo6Apr42OfFy
 icWtTUM1ZnBxc/ZfN5lZVz7f93+2qcBUt+FK489s8xMnCq/o8FfxT29ENJOAu1Fx5R
 RYti3M8dd0qqpqUO+O0UMjfMhL4gX+LJITvXzY87Y92t+ThD85NAFLVAutRPucvfKN
 80SPD4+yeNF26fCI90LdSopH/Nvrl08Ao9Wa0ORyW3VMGhBltuAJlnnWhz2qDycXtL
 NY34fmtOu4c2w==
Date: Tue, 15 Nov 2022 15:19:26 +1100
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Robert Swindells <rjs@fdy2.co.uk>
Subject: Re: [PATCH 1/1] drm/shmem: Dual licence the files as GPL-2 and MIT
Message-ID: <20221115151926.4b4f556e@oak.ozlabs.ibm.com>
In-Reply-To: <20221112194210.7657-2-rjs@fdy2.co.uk>
References: <20221112194210.7657-1-rjs@fdy2.co.uk>
 <20221112194210.7657-2-rjs@fdy2.co.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tgtz_Wyql4G0yhJn8vhTf=.";
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
Cc: dri-devel@lists.freedesktop.org, sfr@canb.auug.org.au,
 marcel.ziswiler@toradex.com, daniel.vetter@ffwll.ch, liuzixian4@huawei.com,
 lucas.demarchi@intel.com, boris.brezillon@collabora.com, nroberts@igalia.com,
 noralf@tronnes.org, cai.huoqing@linux.dev, kraxel@redhat.com,
 tzimmermann@suse.de, kuba@kernel.org, airlied@redhat.com,
 emil.velikov@collabora.com, sam@ravnborg.org, dan.carpenter@oracle.com,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Tgtz_Wyql4G0yhJn8vhTf=.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Robert,

On Sat, 12 Nov 2022 19:42:10 +0000 Robert Swindells <rjs@fdy2.co.uk> wrote:
>
> Contributors to these files are:
>=20
> Stephen Rothwell <sfr@canb.auug.org.au>

I don't think my (1 line) contribution is even copyrightable, but anyway

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>
--=20
Cheers,
Stephen Rothwell

--Sig_/Tgtz_Wyql4G0yhJn8vhTf=.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmNzE04ACgkQAVBC80lX
0GzXrwf/XoMoNAT5e+MOcJzzQCHek5TZOPyom9H/asBFGQXHRsnInrADdadmW0s5
8QoWQRnHqEfc9MJIy2KbW3z/zDOBICPt3Gdt24VJK24Y3n0VMsRthYupolsdEEgh
rmhDhgyG0pStMErCFDrinRhePIKMGCsq4H5S5w/roMhxZF9ppgCOjMdlOBkGKFJu
+is1zpskGwsjlPkEEanTZuemQ7CEtD/qEg0t5lo7w/pUsrTEmtb6vlhKjMSD+H9S
jNb7jtriSYz3+4phzKz3M4+COkXkZixp5sTK/xuqttKazl8hNlRbyZc4u1++t/ep
+fwuNKKp5A8zJGW6eFcTesF/P/Jc9g==
=n4gQ
-----END PGP SIGNATURE-----

--Sig_/Tgtz_Wyql4G0yhJn8vhTf=.--

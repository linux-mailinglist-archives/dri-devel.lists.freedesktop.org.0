Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FB17EA521
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 21:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FC310E42C;
	Mon, 13 Nov 2023 20:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7087910E3A8;
 Mon, 13 Nov 2023 20:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1699908902;
 bh=DUv/lJ8qA5cOJasdLl/4KI3Byg7tjhwKBtZ2bXBLmFg=;
 h=Date:From:To:Cc:Subject:From;
 b=sGxdMDUj2J0vpRNJVDPnvsSgiTBkmBqRh4+/XlynAWcJ19+yoybrg5yDfUuqbDes8
 eK06i4hM5r1YHiENbLd1jqNRMFZO56v3x2m4E6oSrwRXlyTMMwIBZOhwCCH3I5KGsg
 ZjM0euA2XgM7oPbYhIfHqhm7xJX1IL13lvLRTQRhnvvsyS3W2d/J0fz2DUo9PRbyV+
 EmlfcFi+/m6sg7pDX4X0wZ4x2F80eLlCrrwKJCGvNuP8mKtZjNC7l7dmJmV5w8tcSM
 fvLLuy0sMjfImv5wKYNYIBECaj6iT90eyVNZzgliBtz0Pl4jZFwwiUjIJy/jCrtUo/
 xU9SrllY3XfHQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SThWp45pYz4wdF;
 Tue, 14 Nov 2023 07:55:02 +1100 (AEDT)
Date: Tue, 14 Nov 2023 07:55:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: Signed-off-by missing for commit in the drm-misc tree
Message-ID: <20231114075501.61321c29@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Emdt8+VYSRwA677krXtY.UV";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Emdt8+VYSRwA677krXtY.UV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0da611a87021 ("dma-buf: add dma_fence_timestamp helper")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Emdt8+VYSRwA677krXtY.UV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVSjSUACgkQAVBC80lX
0Gwz5Af/YNPogz3RRCNjYLK5dR2VMBX/IRevqIKwxef//cPJ0hDVSYqMmcjQdd7j
sUyw3BvrUkrXC+jPMxAwtsmSC1NoeX0dDC4YrIG2io0RtiYvD6CmX56fkPNcReIf
fSZSHz1FL1qA1gKezWe2xcKP00HILXxUsQQKT0cLaP5j7OvnmRM9oDPccWrgcqyY
9eHNhQ+ylFk8HbNNsvP0ZsgJDO2pS5VDfi3otVnQNhmJRcDipz3apqhyehMLMgDk
4xAsuMVvg99nPQQFtHW7lP3xuY7tHrqYWoOcGdk+Zs2T0afABQ+T05YbZG366sE5
gPhUQ44dm0x/SEBWJjSX9/ZDY1nU4A==
=E4tp
-----END PGP SIGNATURE-----

--Sig_/Emdt8+VYSRwA677krXtY.UV--

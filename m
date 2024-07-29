Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733A893F615
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 15:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EFF10E3C8;
	Mon, 29 Jul 2024 13:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RmZ9YGTy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1383010E3C6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 13:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=7Fa3
 FvYszI2v7tZhjSBxOKf5nK/7KsdWSyZ8VQRbAyE=; b=RmZ9YGTy1Lql42Nce0XQ
 DCxRz2HxWnTwXJfgPaI/CjbbhJlxrcGTP2v2+BileckUZRVtHwmyvYYZ+GF4sA/T
 jPNJUNvhpGn9wpbmDQJctHb0vzURBBt33iYrjt/NxsadNySKffvqdAQ2LGwqhyCY
 nlsGFq06rT1bqOBUn/s9i76a7gzupMZ1XZ/rFG08uxGULDn8lIzcries8WqLiH/a
 qdwYiMYNFzKRQIeT7Z9aPQOeelP+XwOKscd885b+NoGjfiEUuVxj2asd3tsCH47R
 Tvmxsu+BcwUe8QUgryD3QNdLaMZAhLVHTSGQQgCIy3hF5GvPUrvWluqAJKnbNSaj
 wA==
Received: (qmail 4110312 invoked from network); 29 Jul 2024 15:03:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 29 Jul 2024 15:03:14 +0200
X-UD-Smtp-Session: l3s3148p1@8AjSe2Ie+15tKPFk
Date: Mon, 29 Jul 2024 15:03:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Konrad Dybcio <konradybcio@gmail.com>
Cc: linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update email for Konrad Dybcio
Message-ID: <ZqeTEGVjMD0VqRRx@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Konrad Dybcio <konradybcio@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org
References: <20240729125225.2090-2-wsa+renesas@sang-engineering.com>
 <a1ff72a2-7992-4ebd-b48b-2bb85335edaf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/FJwCOto+3YIJsnZ"
Content-Disposition: inline
In-Reply-To: <a1ff72a2-7992-4ebd-b48b-2bb85335edaf@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--/FJwCOto+3YIJsnZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konrad,

> Already sent a series of fixups, but thanks for keeping track

Welcome. Cool that you are at it!

Happy hacking,

   Wolfram


--/FJwCOto+3YIJsnZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmankw0ACgkQFA3kzBSg
KbauLQ//VGH3tiB3g4Zj5iz7b/4cBTixu6XyY7JOrDL2k62xzR2eUiDzJEdR3kP4
p8umhzW69kiEqeOP1CWsGMNfJ5ypd99zrAevJYo5w+YwFeFLofb4oeI+BqUjIlVL
GsFD9KKW14EbRRk1oAELInqkfNCH/0SDWKq/6fpSPmke6Qzwei2VeASua8XtoFp7
Fw8HMjADYi2I0B+EpkL4yzjckLfafmgdtpwrpCWL5hSQ8xKuevEM/OGt+LTTh7lO
vz7Gm7llwr9IZBxe9sVK0WPxs2oPAPhhuwbk9W++FKF7kGcid2QHg2S3zz4MfVSa
7JRGwTGusGpNkmRRpew5033VJ8c1UXYcSRxaEtMYnpoU8F8U5g+TDKzvhkVBofin
aTvK+YdU9+TBzceM/qqfXusoSxvpo6sgNEWrgz1MCg8iSMuygT+G0NK4UCcChSTD
Ys6QTV10FI5cF4CsNEYTDFOnhALtnq68D8wWMIG5Gsn6Wkpazsg+IeYwmNV6pnG5
pVrUeM7ETz9/7xoyRDMc4aPEZjNtzy+uB1STUEb50ag/NbhX9EjO2C7U7BIinCzY
pzvAWFH/cCm8o2yyPSt/3ifNAKe8//lJq9zUZ6c+adHr3GHnKCeO3bjhT15ZrQbR
rs7xewbujhdqeD5jhrkLFyzIttjRVK/Tnn03cnEnFUl9biTKV7I=
=44Db
-----END PGP SIGNATURE-----

--/FJwCOto+3YIJsnZ--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAEF77022B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35E710E6FD;
	Fri,  4 Aug 2023 13:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C694810E6FD;
 Fri,  4 Aug 2023 13:47:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A0C97C422F;
 Fri,  4 Aug 2023 13:38:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C0801C0003;
 Fri,  4 Aug 2023 13:38:11 +0000 (UTC)
From: Diederik de Haas <didi.debian@cknow.org>
To: Karol Herbst <kherbst@redhat.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Olaf Skibbe <news@kravcenko.com>
Subject: Re: Bug#1042753: nouveau bug in linux/6.1.38-2
Date: Fri, 04 Aug 2023 15:38:03 +0200
Message-ID: <1861943.tdWV9SEqCh@bagend>
Organization: Connecting Knowledge
In-Reply-To: <b12e2b00-de18-df9c-eb4a-c6704aad2c97@kravcenko.com>
References: <20be6650-5db3-b72a-a7a8-5e817113cff5@kravcenko.com>
 <169080024768.2498.7944943374763908742.reportbug@oma-1>
 <b12e2b00-de18-df9c-eb4a-c6704aad2c97@kravcenko.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2154434.irdbgypaU6";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-Sasl: didi.debian@cknow.org
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
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 nouveau@lists.freedesktop.org, 1042753@bugs.debian.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart2154434.irdbgypaU6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Subject: Re: Bug#1042753: nouveau bug in linux/6.1.38-2
Date: Fri, 04 Aug 2023 15:38:03 +0200
Message-ID: <1861943.tdWV9SEqCh@bagend>
Organization: Connecting Knowledge
In-Reply-To: <b12e2b00-de18-df9c-eb4a-c6704aad2c97@kravcenko.com>
MIME-Version: 1.0

On Friday, 4 August 2023 15:11:46 CEST Olaf Skibbe wrote:
> (On the occasion a maybe silly question: am I right assuming that the
> kernel has to be build on the machine we want to reproduce the bug on?
> Otherwise it could use much faster hardware (running also bookworm).)

If that is also an amd64 machine running Debian kernel 6.1.38-2, it should be 
fine to build the kernel on the faster machine.
--nextPart2154434.irdbgypaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZMz/OwAKCRDXblvOeH7b
bt4nAQDPFpmbSLHFD7getdYcWSuA7EjAC7ABRIrg2d1k235hpAEA9blNXwSDoplZ
dNmsvFiDM+/jBGYJnl/qIlH6lCd3Hw8=
=Re8d
-----END PGP SIGNATURE-----

--nextPart2154434.irdbgypaU6--




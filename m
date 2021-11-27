Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F5D45FE53
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 12:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874936F528;
	Sat, 27 Nov 2021 11:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Sat, 27 Nov 2021 11:03:10 UTC
Received: from mail.sf-mail.de (mail.sf-mail.de
 [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AD36E8A9
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 11:03:10 +0000 (UTC)
Received: (qmail 5898 invoked from network); 27 Nov 2021 10:56:40 -0000
Received: from p200300cf072ea900047574fffec7eb88.dip0.t-ipconnect.de
 ([2003:cf:72e:a900:475:74ff:fec7:eb88]:34126 HELO eto.sf-tec.de)
 (auth=eike@sf-mail.de)
 by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted)
 ESMTPSA
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 11:56:40 +0100
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] agp: parisc-agp: fix section mismatch warning
Date: Sat, 27 Nov 2021 11:56:08 +0100
Message-ID: <2606759.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <20211127045757.27908-1-rdunlap@infradead.org>
References: <20211127045757.27908-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11872250.O9o76ZdvQC";
 micalg="pgp-sha1"; protocol="application/pgp-signature"
X-Mailman-Approved-At: Sat, 27 Nov 2021 11:46:37 +0000
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
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 kernel test robot <lkp@intel.com>, linux-parisc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, Kyle McMartin <kyle@mcmartin.ca>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart11872250.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 27. November 2021, 05:57:57 CET schrieb Randy Dunlap:
> Fix section mismatch warning in parisc-agp:

Too late ;)

https://lore.kernel.org/linux-parisc/20211126154754.263487-1-deller@gmx.de/

--nextPart11872250.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYaIOyAAKCRBcpIk+abn8
Tvi7AKClZxKBcLo3VyWARYzLALhDJxyLawCcCedq1ebV0hyjSRfwACH3OmSKeO4=
=75tg
-----END PGP SIGNATURE-----

--nextPart11872250.O9o76ZdvQC--




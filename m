Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BE46DA0C6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 21:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FCC10E05C;
	Thu,  6 Apr 2023 19:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Thu, 06 Apr 2023 19:13:52 UTC
Received: from mail.sf-mail.de (mail.sf-mail.de
 [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F1510E05C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 19:13:52 +0000 (UTC)
Received: (qmail 22137 invoked from network); 6 Apr 2023 19:07:16 -0000
Received: from unknown ([2001:9e8:6dc6:3c00:76d4:35ff:feb7:be92]:59950 HELO
 eto.sf-tec.de) (auth=eike@sf-mail.de)
 by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted)
 ESMTPSA for <arnd@arndb.de>; Thu, 06 Apr 2023 21:07:16 +0200
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com,
 gregkh@linuxfoundation.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/18] arch: Consolidate <asm/fb.h>
Date: Thu, 06 Apr 2023 21:06:57 +0200
Message-ID: <2675533.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <20230405150554.30540-1-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12183111.O9o76ZdvQC";
 micalg="pgp-sha1"; protocol="application/pgp-signature"
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart12183111.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH 00/18] arch: Consolidate <asm/fb.h>
Date: Thu, 06 Apr 2023 21:06:57 +0200
Message-ID: <2675533.mvXUDI8C0e@eto.sf-tec.de>
In-Reply-To: <20230405150554.30540-1-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de>

Am Mittwoch, 5. April 2023, 17:05:36 CEST schrieb Thomas Zimmermann:
> Various architectures provide <arm/fb.h> with helpers for fbdev
                                  ^ *lol*

Eike
--nextPart12183111.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCZC8YUQAKCRBcpIk+abn8
Tg14AJ9zd7fmAHjabsNv4XQ0wrtRdP3wSACcCiALyhR78u5AwNndFsBEhTvFQg8=
=2czj
-----END PGP SIGNATURE-----

--nextPart12183111.O9o76ZdvQC--




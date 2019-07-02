Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889745C933
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 08:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6AA899EA;
	Tue,  2 Jul 2019 06:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDA1899EA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 06:20:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E300D305390F;
 Tue,  2 Jul 2019 06:20:03 +0000 (UTC)
Received: from gondolin (ovpn-116-124.ams2.redhat.com [10.36.116.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44C4813424;
 Tue,  2 Jul 2019 06:19:41 +0000 (UTC)
Date: Tue, 2 Jul 2019 08:19:38 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH 29/39] docs: driver-api: add a series of orphaned documents
Message-ID: <20190702081938.08b238cc.cohuck@redhat.com>
In-Reply-To: <8ac86487399c5cfa180f3d6dad5de944a40c3520.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
 <8ac86487399c5cfa180f3d6dad5de944a40c3520.1561724493.git.mchehab+samsung@kernel.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 02 Jul 2019 06:20:17 +0000 (UTC)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Farhan Ali <alifm@linux.ibm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Kirti Wankhede <kwankhede@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Jiri Slaby <jslaby@suse.com>,
 Darren Hart <dvhart@infradead.org>, linux-pwm@vger.kernel.org,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 platform-driver-x86@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 linux-pci@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
 Stuart Hayes <stuart.w.hayes@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Logan Gunthorpe <logang@deltatee.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOCBKdW4gMjAxOSAwOTozMDoyMiAtMDMwMApNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKCj4gVGhlcmUgYXJlIGxvdHMgb2Yg
ZG9jdW1lbnRzIHVuZGVyIERvY3VtZW50YXRpb24vKi50eHQgYW5kIGEgZmV3IG90aGVyCj4gb3Jw
aGFuIGRvY3VtZW50cyBlbHNlaHdlcmUgdGhhdCBiZWxvbmcgdG8gdGhlIGRyaXZlci1BUEkgYm9v
ay4KPiAKPiBNb3ZlIHRoZW0gdG8gdGhlaXIgcmlnaHQgcGxhY2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KPiAt
LS0KKC4uLikKPiAgLi4uL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdH0gICAgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgLi4uL3t2ZmlvLnR4dCA9PiBkcml2ZXItYXBpL3ZmaW8ucnN0fSAgICAgICAg
IHwgIDAKKC4uLikKPiAgRG9jdW1lbnRhdGlvbi9zMzkwL3ZmaW8tY2N3LnJzdCAgICAgICAgICAg
ICAgIHwgIDYgKystLS0KKC4uLikKPiAgZHJpdmVycy92ZmlvL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy92ZmlvL21kZXYvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KClJldmlld2VkLWJ5OiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tA
cmVkaGF0LmNvbT4gW3ZmaW8tcmVsYXRlZCBwYXJ0c10KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs

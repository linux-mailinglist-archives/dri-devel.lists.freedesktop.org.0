Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8345A60431
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 12:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAA26E47A;
	Fri,  5 Jul 2019 10:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BBB6E47A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 10:12:01 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 9E1CA80601; Fri,  5 Jul 2019 12:11:48 +0200 (CEST)
Date: Fri, 5 Jul 2019 12:11:51 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH 4/4] devicetree: Add led-backlight binding
Message-ID: <20190705101151.kmyvccbjitfqe4fv@devuan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701151423.30768-5-jjhiblot@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgo+IEFkZCBEVCBiaW5kaW5nIGZvciBsZWQtYmFja2xpZ2h0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgo+IENjOiBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZwo+IC0tLQoKPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiArICAtIGNv
bXBhdGlibGU6ICJsZWQtYmFja2xpZ2h0Igo+ICsgIC0gYnJpZ2h0bmVzcy1sZXZlbHM6IEFycmF5
IG9mIGRpc3RpbmN0IExFRCBicmlnaHRuZXNzIGxldmVscy4gVGhlc2UKPiArICAgICAgYXJlIGlu
IHRoZSByYW5nZSBmcm9tIDAgdG8gMjU1LCBwYXNzZWQgdG8gdGhlIExFRCBjbGFzcyBkcml2ZXIu
CgpUaGVzZSBkYXlzLCB3ZSBzdXBwb3J0IG1vcmUgKG9yIGxlc3MpIHRoYW4gMjU2IGJyaWdodG5l
c3MgbGV2ZWxzIGZvciBMRUQuCgkJCQkJCQkJCVBhdmVsCi0tIAooZW5nbGlzaCkgaHR0cDovL3d3
dy5saXZlam91cm5hbC5jb20vfnBhdmVsbWFjaGVrCihjZXNreSwgcGljdHVyZXMpIGh0dHA6Ly9h
dHJleS5rYXJsaW4ubWZmLmN1bmkuY3ovfnBhdmVsL3BpY3R1cmUvaG9yc2VzL2Jsb2cuaHRtbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818F258862
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 19:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8546E837;
	Thu, 27 Jun 2019 17:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE23A6E31E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 17:31:24 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id F0B2C537;
 Thu, 27 Jun 2019 17:31:23 +0000 (UTC)
Date: Thu, 27 Jun 2019 11:31:22 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: fix a reference for a renamed file: fb/modedb.rst
Message-ID: <20190627113122.34b46ee2@lwn.net>
In-Reply-To: <20190626212735.GY12905@phenom.ffwll.local>
References: <699d7618720e2808f9aa094a13ab2f3545c3c25c.1561565652.git.mchehab+samsung@kernel.org>
 <20190626212735.GY12905@phenom.ffwll.local>
Organization: LWN.net
MIME-Version: 1.0
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 David Airlie <airlied@linux.ie>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNiBKdW4gMjAxOSAyMzoyNzozNSArMDIwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgoKPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwMToxNDoxM1BNIC0w
MzAwLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4gPiBEdWUgdG8gdHdvIHBhdGNoZXMg
YmVpbmcgYXBwbGllZCBhYm91dCB0aGUgc2FtZSB0aW1lLCB0aGUKPiA+IHJlZmVyZW5jZSBmb3Ig
bW9kZWRiLnJzdCBmaWxlIGdvdCB3cm9uZzoKPiA+IAo+ID4gCURvY3VtZW50YXRpb24vZmIvbW9k
ZWRiLnR4dCBpcyBub3cgRG9jdW1lbnRhdGlvbi9mYi9tb2RlZGIucnN0Lgo+ID4gCj4gPiBGaXhl
czogMWJmNGUwOTIyN2MzICgiZHJtL21vZGVzOiBBbGxvdyB0byBzcGVjaWZ5IHJvdGF0aW9uIGFu
ZCByZWZsZWN0aW9uIG9uIHRoZSBjb21tYW5kbGluZSIpCj4gPiBGaXhlczogYWI0MmI4MTg5NTRj
ICgiZG9jczogZmI6IGNvbnZlcnQgZG9jcyB0byBSZVNUIGFuZCByZW5hbWUgdG8gKi5yc3QiKQo+
ID4gU2lnbmVkLW9mZi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdA
a2VybmVsLm9yZz4gIAo+IAo+IFdoYXQncyB0aGUgbWVyZ2UgcGxhbiBoZXJlPyBkb2MtbmV4dD8g
SWYgc286Cj4gCj4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+CgpJdCBkb2Vzbid0IHJlYWxseSBhcHBseSB0byBkb2NzLW5leHQsIHNvIHRoYXQncyBwcm9i
YWJseSBub3QgdGhlIGJlc3QKcGF0aCB1bmxlc3MgSSBob2xkIGl0IHVudGlsIGFmdGVyIHRoZSBt
ZXJnZSB3aW5kb3cuICBTZWVtcyBsaWtlIGl0IG5lZWRzCnRvIGdvIHRocm91Z2ggdGhlIERSTSB0
cmVlIHRvIG1lLgoKVGhhbmtzLAoKam9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==

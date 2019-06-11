Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BAF3D0F9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 17:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1145389202;
	Tue, 11 Jun 2019 15:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AF189202
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 15:37:03 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id A356C382;
 Tue, 11 Jun 2019 15:37:02 +0000 (UTC)
Date: Tue, 11 Jun 2019 09:37:01 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v3 33/33] docs: EDID/HOWTO.txt: convert it and rename to
 howto.rst
Message-ID: <20190611093701.44344d00@lwn.net>
In-Reply-To: <20190611060215.232af2bb@coco.lan>
References: <cover.1560045490.git.mchehab+samsung@kernel.org>
 <74bec0b5b7c32c8d84adbaf9ff208803475198e5.1560045490.git.mchehab+samsung@kernel.org>
 <20190611083731.GS21222@phenom.ffwll.local>
 <20190611060215.232af2bb@coco.lan>
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
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMSBKdW4gMjAxOSAwNjowMjoxNSAtMDMwMApNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKCj4gSm9uLCBwbGVhc2UgY29ycmVj
dCBtZSBpZiBJJyB3cm9uZywgYnUgSSBndWVzcyB0aGUgcGxhbiBpcyB0byBwbGFjZSB0aGVtIAo+
IHNvbWV3aGVyZSB1bmRlciBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlLy4KClRoYXQgbWFrZXMg
c2Vuc2UgdG8gbWUuCgo+IElmIHNvLCBwZXJoYXBzIGNyZWF0aW5nIGEgRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9kcm0gZGlyIHRoZXJlIGFuZCAKPiBwbGFjZSBkb2NzIGxpa2UgRURJRC9IT1dU
Ty50eHQsIHN2Z2EudHh0LCBldGMgd291bGQgd29yay4KCk1heWJlICJncmFwaGljcyIgb3IgImRp
c3BsYXkiIHJhdGhlciB0aGFuICJkcm0iLCB3aGljaCBtYXkgbm90IGVudGlyZWx5CmFwcGxpY2Fi
bGUgdG8gYWxsIG9mIHRob3NlIGRvY3Mgb3IgYXMgZmFtaWxpYXIgdG8gYWxsIGFkbWlucz8KCj4g
QnR3LCB0aGF0J3Mgb25lIG9mIHRoZSByZWFzb25zWzFdIHdoeSBJIG9wdGVkIHRvIGtlZXAgdGhl
IGZpbGVzIHdoZXJlIHRoZXkKPiBhcmU6IHByb3Blcmx5IG9yZ2FuaXppbmcgdGhlIGNvbnZlcnRl
ZCBkb2N1bWVudHMgY2FsbCBmb3Igc3VjaCBraW5kCj4gb2YgZGlzY3Vzc2lvbnMuIE9uIG15IGV4
cGVyaWVuY2UsIGRpc2N1c3NpbmcgbmFtZXMgYW5kIGRpcmVjdG9yeSBsb2NhdGlvbnMKPiBjYW4g
Z2VuZXJhdGUgd2FybSBkaXNjdXNzaW9ucyBhbmQgdGFrZSBhIGxvdCBvZiB0aW1lIHRvIHJlYWNo
IGNvbnNlbnN1cy4KCk1vdmluZyBkb2NzIGlzIGEgcGFpbjsgbXkgbGlmZSB3b3VsZCBjZXJ0YWlu
bHkgYmUgZWFzaWVyIGlmIEkgd2VyZSBoYXBweQp0byBqdXN0IGxldCBldmVyeXRoaW5nIGxpZSB3
aGVyZSBpdCBmZWxsIDopICBCdXQgaXQncyBmYXIgZnJvbSB0aGUgaGFyZGVzdApwcm9ibGVtIHdl
IHNvbHZlIGluIGtlcm5lbCBkZXZlbG9wbWVudCwgSSBhc3N1bWUgd2UgY2FuIGZpZ3VyZSBpdCBv
dXQuCgpUaGFua3MsCgpqb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

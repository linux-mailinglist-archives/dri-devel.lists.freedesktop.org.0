Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68360442
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 12:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B046E47E;
	Fri,  5 Jul 2019 10:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190AD6E47F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 10:14:42 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id BECCC8022F; Fri,  5 Jul 2019 12:14:29 +0200 (CEST)
Date: Fri, 5 Jul 2019 12:14:34 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH 0/4] Add a generic driver for LED-based backlight
Message-ID: <20190705101434.fw5rpctnqt6dwg6e@devuan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uIDIwMTktMDctMDEgMTc6MTQ6MTksIEplYW4tSmFjcXVlcyBIaWJsb3Qgd3JvdGU6Cj4g
VGhpcyBzZXJpZXMgYWltcyB0byBhZGQgYSBsZWQtYmFja2xpZ2h0IGRyaXZlciwgc2ltaWxhciB0
byBwd20tYmFja2xpZ2h0LAo+IGJ1dCB1c2luZyBhIExFRCBjbGFzcyBkZXZpY2UgdW5kZXJuZWF0
aC4KPiAKPiBBIGZldyB5ZWFycyBhZ28gKDIwMTUpLCBUb21pIFZhbGtlaW5lbiBwb3N0ZWQgYSBz
ZXJpZXMgaW1wbGVtZW50aW5nIGEKPiBiYWNrbGlnaHQgZHJpdmVyIG9uIHRvcCBvZiBhIExFRCBk
ZXZpY2U6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC83MjkzOTkxLwo+IGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNzI5NDAwMS8KPiBodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3BhdGNoLzcyOTM5ODEvCj4gCj4gVGhlIGRpc2N1c3Npb24gc3RvcHBl
ZCBiZWNhdXNlIFRvbWkgbGFja2VkIHRoZSB0aW1lIHRvIHdvcmsgb24gaXQuCj4gCj4gVGhpcyBz
ZXJpZXMgdGFrZXMgaXQgZnJvbSB0aGVyZSBhbmQgaW1wbGVtZW50cyB0aGUgYmluZGluZyB0aGF0
IHdhcwo+IGRpc2N1c3NlZCBpbiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzcy
OTM5OTEvLiBJbiB0aGlzIG5ldwo+IGJpbmRpbmcgdGhlIGJhY2tsaWdodCBkZXZpY2UgaXMgYSBj
aGlsZCBvZiB0aGUgTEVEIGNvbnRyb2xsZXIgaW5zdGVhZCBvZgo+IGJlaW5nIGFub3RoZXIgcGxh
dGZvcm0gZGV2aWNlIHRoYXQgdXNlcyBhIHBoYW5kbGUgdG8gcmVmZXJlbmNlIGEgTEVELgoKT3Ro
ZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGhhdmUgYmFja2xpZ2h0IHRyaWdnZXIuIFdoYXQgYXJlCmFk
dmFudGFnZXMvZGlzYWR2YW50YWdlcyByZWxhdGl2ZSB0byB0aGF0PwoJCQkJCQkJCQlQYXZlbAoK
LS0gCihlbmdsaXNoKSBodHRwOi8vd3d3LmxpdmVqb3VybmFsLmNvbS9+cGF2ZWxtYWNoZWsKKGNl
c2t5LCBwaWN0dXJlcykgaHR0cDovL2F0cmV5Lmthcmxpbi5tZmYuY3VuaS5jei9+cGF2ZWwvcGlj
dHVyZS9ob3JzZXMvYmxvZy5odG1sCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==

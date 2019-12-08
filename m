Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566791169EB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81C46E351;
	Mon,  9 Dec 2019 09:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6176E029
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2019 20:06:28 +0000 (UTC)
Received: from belgarion ([90.55.212.38]) by mwinf5d14 with ME
 id bY6Q2100B0qFw6q03Y6QC6; Sun, 08 Dec 2019 21:06:25 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Sun, 08 Dec 2019 21:06:25 +0100
X-ME-IP: 90.55.212.38
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: corgi: Convert to use GPIO descriptors
References: <20191203123143.118487-1-linus.walleij@linaro.org>
X-URL: http://belgarath.falguerolles.org/
Date: Sun, 08 Dec 2019 21:06:24 +0100
In-Reply-To: <20191203123143.118487-1-linus.walleij@linaro.org> (Linus
 Walleij's message of "Tue, 3 Dec 2019 13:31:43 +0100")
Message-ID: <87sgluy43j.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
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
Cc: Andrea Adami <andrea.adami@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cml0ZXM6CgpIaSBMaW51
cywKCj4gQEAgLTUyNSwxMyArNTI1LDMzIEBAIHN0YXRpYyB2b2lkIHNwaXR6X2JsX2tpY2tfYmF0
dGVyeSh2b2lkKQo+ICAJfQo+ICB9Cj4gIAo+ICtzdGF0aWMgc3RydWN0IGdwaW9kX2xvb2t1cF90
YWJsZSBzcGl0el9sY2Rjb25fZ3Bpb190YWJsZSA9IHsKPiArCS5kZXZfaWQgPSAic3BpMC4xIiwK
SG93IGRvIHlvdSBrbm93IHRoZSBjb3JyZWN0IGRldmljZSBuYW1lIGlzICJzcGkwLjEiID8KCkNo
ZWVycy4KCi0tClJvYmVydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

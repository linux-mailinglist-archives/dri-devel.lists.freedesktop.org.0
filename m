Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD6128442
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 18:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB256E03D;
	Thu, 23 May 2019 16:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67DF6E038;
 Thu, 23 May 2019 16:53:24 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B6E0A20075;
 Thu, 23 May 2019 18:53:21 +0200 (CEST)
Date: Thu, 23 May 2019 18:53:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Linus Walleij <linus.walleij@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v6 0/8] drm/fb-helper: Move modesetting code to drm_client
Message-ID: <20190523165320.GA7770@ravnborg.org>
References: <20190523134413.4210-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523134413.4210-1-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=NRSDr2N9MlqeW77PYjoA:9 a=CjuIK1q_8ugA:10
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsIEdlcmQuCgo+IFRoaXMgbW92ZXMgdGhlIG1vZGVzZXR0aW5nIGNvZGUgZnJvbSBk
cm1fZmJfaGVscGVyIHRvIGRybV9jbGllbnQgc28gaXQKPiBjYW4gYmUgc2hhcmVkIGJ5IGFsbCBp
bnRlcm5hbCBjbGllbnRzLgoKQ291bGQgb25lIG9mIHlvdSB0YWtlIGEgbG9vayBhdCB0aGlzIHNl
cmllcy4KRGFuaWVsIGFscmVhZHkgYWNrJ2VkIHRoZSBzZXJpZXMgb24gaXJjLCBidXQgYW4gZXh0
cmEgcGFpciBvZiBleWVzCmlzIG5ldmVyIGJhZC4KCkZvciBteSBwYXJ0IEkgaGF2ZSBiZWVuIHRo
cm91Z2ggdGhlbSBhbGwsIGJ1dCBJIHN0aWxsIGRvIG5vdCBoYXZlCnRoZSBmdWxsIHBpY3R1cmUg
b2YgdGhlIERSTSBzdWJzeXN0ZW0gc28gbXkgcmV2aWV3IG1heSBub3QKc3VmZmljZS4KCglTYW0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

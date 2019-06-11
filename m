Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F18D93CA12
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 13:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1856891C0;
	Tue, 11 Jun 2019 11:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E69891C0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:32:51 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16862992-1500050 for multiple; Tue, 11 Jun 2019 12:31:13 +0100
MIME-Version: 1.0
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190611112859.16375-1-daniel.vetter@ffwll.ch>
References: <20190611112859.16375-1-daniel.vetter@ffwll.ch>
Message-ID: <156025267180.19742.5563354327073648468@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/fb: document dirty helper better
Date: Tue, 11 Jun 2019 12:31:11 +0100
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
Cc: David Lechner <david@lechnology.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA2LTExIDEyOjI4OjU5KQo+IEFwcGFyZW50bHkg
bGl0dGxlIG5vbmUgZmFjdCB0aGF0IHRoZXJlJ3Mgbm8gbmVlZCB0byBoYW5kLXJvbGwgeW91ciBv
d24Kcy9ub25lL2tub3duLwo+IGFueW1vcmUuIENjJ2luZyBhIGJ1bmNoIG9mIGRyaXZlciBwZW9w
bGUgd2hvIG1pZ2h0IHdhbnQgdG8ga25vdyB0aGlzCj4gdG9vLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

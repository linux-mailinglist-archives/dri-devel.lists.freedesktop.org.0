Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E782116A52B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 12:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC706E0AA;
	Mon, 24 Feb 2020 11:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B525D6E0AA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 11:41:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20330508-1500050 for multiple; Mon, 24 Feb 2020 11:40:40 +0000
MIME-Version: 1.0
To: Emmanuel Vadot <manu@FreeBSD.org>, Jani Nikula <jani.nikula@intel.com>,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 efremov@linux.com, kraxel@redhat.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, noralf@tronnes.org,
 sam@ravnborg.org, tzimmermann@suse.de
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <877e0n66qi.fsf@intel.com>
References: <20200215180911.18299-1-manu@FreeBSD.org>
 <20200215180911.18299-2-manu@FreeBSD.org> <877e0n66qi.fsf@intel.com>
Message-ID: <158254443806.15220.5582277260130009235@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v2 1/2] drm/client: Dual licence the file in GPL-2 and MIT
Date: Mon, 24 Feb 2020 11:40:38 +0000
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
Cc: Emmanuel Vadot <manu@FreeBSD.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBKYW5pIE5pa3VsYSAoMjAyMC0wMi0xNSAxODozMzowOSkKPiBPbiBTYXQsIDE1IEZl
YiAyMDIwLCBFbW1hbnVlbCBWYWRvdCA8bWFudUBGcmVlQlNELm9yZz4gd3JvdGU6Cj4gPiBGcm9t
OiBFbW1hbnVlbCBWYWRvdCA8bWFudUBGcmVlQlNELk9yZz4KPiA+Cj4gPiBDb250cmlidXRvcnMg
Zm9yIHRoaXMgZmlsZSBhcmUgOgo+ID4gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Cj4gPiBEZW5pcyBFZnJlbW92IDxlZnJlbW92QGxpbnV4LmNvbT4KPiA+IEphbmkgTmlr
dWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gPiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtl
cm5lbC5vcmc+Cj4gPiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiA+IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiA+IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEVtbWFudWVsIFZhZG90IDxt
YW51QEZyZWVCU0Qub3JnPgo+IAo+IEkndmUgb25seSBjb252ZXJ0ZWQgc29tZSBsb2dnaW5nLgo+
IAo+IEFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgoKQm9udXMg
YWNrIGZyb20gYW5vdGhlciBJbnRlbCBlbXBsb3llZSB0byBjb3ZlciBhbGwgSW50ZWwgY29weXJp
Z2h0IGluCnRoaXMgZmlsZSwKQWNrZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==

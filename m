Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3172F2DD07
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 14:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F6E6E2F6;
	Wed, 29 May 2019 12:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9DC6E2F6;
 Wed, 29 May 2019 12:28:09 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16719614-1500050 for multiple; Wed, 29 May 2019 13:28:03 +0100
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <155912801762.13891.15171740473591714585@skylake-alporthouse-com>
References: <20190529110355.GA19119@mwanda>
 <155912801762.13891.15171740473591714585@skylake-alporthouse-com>
Message-ID: <155913288011.13891.1426155673802597558@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: selftest_lrc: Check the correct variable
Date: Wed, 29 May 2019 13:28:00 +0100
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
Cc: kernel-janitors@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 David Airlie <airlied@linux.ie>, Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.william.auld@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDUtMjkgMTI6MDY6NTcpCj4gUXVvdGluZyBEYW4g
Q2FycGVudGVyICgyMDE5LTA1LTI5IDEyOjAzOjU1KQo+ID4gV2Ugc2hvdWxkIGNoZWNrICJyZXF1
ZXN0W25dIiBpbnN0ZWFkIG9mIGp1c3QgInJlcXVlc3QiLgo+ID4gCj4gPiBGaXhlczogNzhlNDFk
ZGQyMTk4ICgiZHJtL2k5MTU6IEFwcGx5IGFuIGV4ZWN1dGlvbl9tYXNrIHRvIHRoZSB2aXJ0dWFs
X2VuZ2luZSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVy
QG9yYWNsZS5jb20+Cj4gCj4gT29wcy4KPiBSZXZpZXdkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KCnMvUmV2aWV3ZC9SZXZpZXdlZC8KQW5kIHB1c2hlZCwgdGhh
bmtzIGZvciB0aGUgZml4LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276AD820F9
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 17:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122B189FD9;
	Mon,  5 Aug 2019 15:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DC089FD9;
 Mon,  5 Aug 2019 15:59:12 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17894656-1500050 for multiple; Mon, 05 Aug 2019 16:58:58 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20190805154554.3476-1-christian.koenig@amd.com>
In-Reply-To: <20190805154554.3476-1-christian.koenig@amd.com>
Message-ID: <156502073694.28464.1595909334726483969@skylake-alporthouse-com>
Subject: Re: [PATCH 1/5] drm/i915: stop pruning reservation object after wait
Date: Mon, 05 Aug 2019 16:58:56 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA4LTA1IDE2OjQ1OjUwKQo+IFRoZSByZXNl
cnZhdGlvbiBvYmplY3Qgc2hvdWxkIGJlIGNhcGFibGUgb2YgaGFuZGxpbmcgaXRzIGludGVybmFs
IG1lbW9yeQo+IG1hbmFnZW1lbnQgaXRzZWxmLiBBbmQgc2luY2Ugd2Ugc2VhcmNoIGZvciBhIGZy
ZWUgc2xvdCB0byBhZGQgdGhlIGZlbmNlCj4gZnJvbSB0aGUgYmVnaW5uaW5nIHRoaXMgaXMgYWN0
dWFsbHkgYSB3YXN0ZSBvZiB0aW1lIGFuZCBvbmx5IG1pbmltYWwgaGVscGZ1bC4KCiJGcm9tIHRo
ZSBiZWdpbm5pbmc/IiBBdHRlbXB0aW5nIHRvIHBydW5lIHNpZ25hbGVkIGZlbmNlcyBvbiBpbnNl
cnRpb24gaXMKcXVpdGUgcmVjZW50LgoKSG93ZXZlciwgdGhhdCBkb2Vzbid0IGhlbHAgdGhlIGNh
c2VzIHdoZXJlIHJlc2VydmF0aW9uX29iamVjdCBrZWVwcyBvbgpob2xkaW5nIGEgcmVmZXJlbmNl
IHRvIHRoZSBmZW5jZXMgZm9yIGlkbGUgb2JqZWN0cy4gSXQncyBhbiBhYnNvbHV0ZQpuaWdodG1h
cmUgb2YgYSByZWZlcmVuY2UgdHJhcC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==

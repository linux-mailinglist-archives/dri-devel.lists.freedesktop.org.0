Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B628488ADB
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 12:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005C76E2D1;
	Sat, 10 Aug 2019 10:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6206E2D1;
 Sat, 10 Aug 2019 10:45:51 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17952269-1500050 for multiple; Sat, 10 Aug 2019 11:45:49 +0100
MIME-Version: 1.0
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190809222643.23142-14-matthew.auld@intel.com>
References: <20190809222643.23142-1-matthew.auld@intel.com>
 <20190809222643.23142-14-matthew.auld@intel.com>
Message-ID: <156543394708.2301.10271358741581892499@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH v3 13/37] drm/i915/selftests: move
 gpu-write-dw into utils
Date: Sat, 10 Aug 2019 11:45:47 +0100
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXR0aGV3IEF1bGQgKDIwMTktMDgtMDkgMjM6MjY6MTkpCj4gVXNpbmcgdGhlIGdw
dSB0byB3cml0ZSB0byBzb21lIGR3b3JkIG92ZXIgYSBudW1iZXIgb2YgcGFnZXMgaXMgcmF0aGVy
Cj4gdXNlZnVsLCBhbmQgd2UgYWxyZWFkeSBoYXZlIHR3byBjb3BpZXMgb2Ygc3VjaCBhIHRoaW5n
LCBhbmQgd2UgZG9uJ3QKPiB3YW50IGEgdGhpcmQgc28gbW92ZSBpdCB0byB1dGlscy4gVGhlcmUg
aXMgcHJvYmFibHkgc29tZSBvdGhlciBzdHVmZgo+IGFsc28uLi4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

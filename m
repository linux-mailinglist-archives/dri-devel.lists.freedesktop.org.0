Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0393D6CD41
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 13:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7D86E39E;
	Thu, 18 Jul 2019 11:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3806E39B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 11:18:54 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17396990-1500050 for multiple; Thu, 18 Jul 2019 12:18:50 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: Chunming Zhou <david1.zhou@amd.com>, dri-devel@lists.freedesktop.org
References: <20190718111339.25126-1-david1.zhou@amd.com>
In-Reply-To: <20190718111339.25126-1-david1.zhou@amd.com>
Message-ID: <156344872806.23055.12897857019960560550@skylake-alporthouse-com>
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
Date: Thu, 18 Jul 2019 12:18:48 +0100
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

UXVvdGluZyBDaHVubWluZyBaaG91ICgyMDE5LTA3LTE4IDEyOjEzOjM5KQo+IGlmIFdBSVRfRk9S
X1NVQk1JVCBpc24ndCBzZXQgYW5kIGluIHRoZSBtZWFud2hpbGUgbm8gdW5kZXJseWluZyBmZW5j
ZSBvbiBzeW5jb2JqLAo+IHRoZW4gcmV0dXJuIG5vbi1ibG9jayBlcnJvciBjb2RlIHRvIHVzZXIg
c2FwY2UuCgpCbG9jayBkZXZpY2UgcmVxdWlyZWQ/CgpJIHByZXN1bWUgeW91IHRyaWVkIHRoZSBF
V09VTERCTE9DSyB3aGljaCB3b3VsZCBiZSBpbXBsaWVkIGJ5IHlvdXIKc2VudGVuY2UgYW5kIGZv
dW5kIHRoYXQgd291bGQgYmUgYW4gaW50ZXJlc3RpbmcgZXhwZXJpZW5jZS4KLUNocmlzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

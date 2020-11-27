Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB1C2C6760
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 15:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092456EDD3;
	Fri, 27 Nov 2020 14:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EED16EDC2;
 Fri, 27 Nov 2020 14:04:43 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23133947-1500050 for multiple; Fri, 27 Nov 2020 14:04:39 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-127-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-127-matthew.auld@intel.com>
Subject: Re: [RFC PATCH 126/162] drm/i915/gem: Update shmem available memory
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 14:04:38 +0000
Message-ID: <160648587887.2925.7439507938668226040@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>, CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXR0aGV3IEF1bGQgKDIwMjAtMTEtMjcgMTI6MDY6NDIpCj4gRnJvbTogQm9tbXUg
S3Jpc2huYWlhaCA8a3Jpc2huYWlhaC5ib21tdUBpbnRlbC5jb20+Cj4gCj4gVXBkYXRlIHNobWVt
IGF2YWlsYWJsZSBtZW1vcnkgaW4g4oCcaW50ZWxfbWVtb3J5X3JlZ2lvbuKAnQoKV2FzIGF2YWls
IGV2ZXIgc2V0PwotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==

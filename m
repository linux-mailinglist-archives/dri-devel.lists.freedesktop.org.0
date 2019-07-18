Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6231C6CE9B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 15:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF296E3BB;
	Thu, 18 Jul 2019 13:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AFA6E3BB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 13:10:52 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17400085-1500050 for multiple; Thu, 18 Jul 2019 14:10:46 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chunming Zhou <zhoucm1@amd.com>
References: <20190718111339.25126-1-david1.zhou@amd.com>
 <156344872806.23055.12897857019960560550@skylake-alporthouse-com>
 <8343b732-2e4b-31f0-9e68-18171977a606@amd.com>
In-Reply-To: <8343b732-2e4b-31f0-9e68-18171977a606@amd.com>
Message-ID: <156345544398.24728.3877059803253335858@skylake-alporthouse-com>
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
Date: Thu, 18 Jul 2019 14:10:44 +0100
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

UXVvdGluZyBDaHVubWluZyBaaG91ICgyMDE5LTA3LTE4IDE0OjA0OjA5KQo+IAo+IOWcqCAyMDE5
LzcvMTggMTk6MTgsIENocmlzIFdpbHNvbiDlhpnpgZM6Cj4gPiBRdW90aW5nIENodW5taW5nIFpo
b3UgKDIwMTktMDctMTggMTI6MTM6MzkpCj4gPj4gaWYgV0FJVF9GT1JfU1VCTUlUIGlzbid0IHNl
dCBhbmQgaW4gdGhlIG1lYW53aGlsZSBubyB1bmRlcmx5aW5nIGZlbmNlIG9uIHN5bmNvYmosCj4g
Pj4gdGhlbiByZXR1cm4gbm9uLWJsb2NrIGVycm9yIGNvZGUgdG8gdXNlciBzYXBjZS4KPiA+IEJs
b2NrIGRldmljZSByZXF1aXJlZD8KPiAKPiBZZXMsIGlmIFdBSVRfRk9SX1NVQk1JVCBpcyBzZXQs
IHRoZW4gdGhhdCB3aWxsIGJsb2NrIGRldmljZS4KCk5vLCB0aGUgZXJyb3IgbWVzc2FnZSBpcyB0
aGF0IGl0IHJlcXVpcmVzIGEgImJsb2NrIGRldmljZSIsIG5vdCB0aGF0IGl0CndpbGwgYmxvY2sg
dGhlIGRldmljZSwgd2hpY2ggaXMgRVdPVUxEQkxPQ0suCi1DaHJpcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5E47C167
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 14:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B0789D42;
	Wed, 31 Jul 2019 12:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4345F89D42
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 12:33:46 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17759077-1500050 for multiple; Wed, 31 Jul 2019 13:33:31 +0100
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
User-Agent: alot/0.6
To: =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
References: <20190731113853.51779-1-christian.koenig@amd.com>
In-Reply-To: <20190731113853.51779-1-christian.koenig@amd.com>
Message-ID: <156457641010.6373.7515721920178088211@skylake-alporthouse-com>
Subject: Re: [PATCH] dma-buf: add more reservation object locking wrappers
Date: Wed, 31 Jul 2019 13:33:30 +0100
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

UXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDE5LTA3LTMxIDEyOjM4OjUzKQo+IENvbXBsZXRl
IHRoZSBhYnN0cmFjdGlvbiBvZiB0aGUgd3dfbXV0ZXggaW5zaWRlIHRoZSByZXNlcnZhdGlvbiBv
YmplY3QuCj4gCj4gVGhpcyBhbGxvd3MgdXMgdG8gYWRkIG1vcmUgaGFuZGxpbmcgYW5kIGRlYnVn
Z2luZyB0byB0aGUgcmVzZXJ2YXRpb24KPiBvYmplY3QgaW4gdGhlIGZ1dHVyZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpM
b29rcyBlbnRpcmVseSBtZWNoYW5pY2FsLApSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+CgpRdWlldGx5IG9waW5lcyBmb3Igcy9yZXNlcnZhdGlvbl9v
YmplY3QvZG1hX3Jlc2VydmF0aW9uLwotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

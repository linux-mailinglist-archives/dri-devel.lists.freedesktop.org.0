Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E6878ED
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 13:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB566ED88;
	Fri,  9 Aug 2019 11:44:13 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56276ED88
 for <dri-devel@freedesktop.org>; Fri,  9 Aug 2019 11:44:11 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17942432-1500050 for multiple; Fri, 09 Aug 2019 12:44:02 +0100
MIME-Version: 1.0
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190809113030.2547-2-lionel.g.landwerlin@intel.com>
References: <20190809113030.2547-1-lionel.g.landwerlin@intel.com>
 <20190809113030.2547-2-lionel.g.landwerlin@intel.com>
Message-ID: <156535104115.29541.10253048719287893942@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v4 1/1] drm/syncobj: add sideband payload
Date: Fri, 09 Aug 2019 12:44:01 +0100
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
Cc: Christian Koenig <Christian.Koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOS0wOC0wOSAxMjozMDozMCkKPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgKPiBp
bmRleCA4YTViMmY4ZjhlYjkuLjFjZTgzODUzZjk5NyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3Vh
cGkvZHJtL2RybS5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm0uaAo+IEBAIC03ODUsNiAr
Nzg1LDIyIEBAIHN0cnVjdCBkcm1fc3luY29ial90aW1lbGluZV9hcnJheSB7Cj4gICAgICAgICBf
X3UzMiBwYWQ7Cj4gIH07Cj4gIAo+ICtzdHJ1Y3QgZHJtX3N5bmNvYmpfYmluYXJ5X2FycmF5IHsK
PiArICAgICAgIC8qIEEgcG9pbnRlciB0byBhbiBhcnJheSBvZiB1MzIgc3luY29iaiBoYW5kbGVz
LiAqLwo+ICsgICAgICAgX191NjQgaGFuZGxlczsKPiArICAgICAgIC8qIEEgcG9pbnRlciB0byBh
biBhcnJheSBvZiB1MzIgYWNjZXNzIGZsYWdzIGZvciBlYWNoIGhhbmRsZS4gKi8KPiArICAgICAg
IF9fdTY0IGFjY2Vzc19mbGFnczsKPiArICAgICAgIC8qIFRoZSBiaW5hcnkgdmFsdWUgb2YgYSBz
eW5jb2JqIGlzIHJlYWQgYmVmb3JlIGl0IGlzIGluY3JlbWVudGVkLiAqLwo+ICsjZGVmaW5lIEk5
MTVfRFJNX1NZTkNPQkpfQklOQVJZX0lURU1fVkFMVUVfUkVBRCAoMXUgPDwgMCkKPiArI2RlZmlu
ZSBJOTE1X0RSTV9TWU5DT0JKX0JJTkFSWV9JVEVNX1ZBTFVFX0lOQyAgKDF1IDw8IDEpCgpZb3Un
cmUgbm90IGluIEthbnNhcyBhbnltb3JlIDspCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

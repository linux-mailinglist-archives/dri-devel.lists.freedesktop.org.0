Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA701B5BC0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 14:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3436E454;
	Thu, 23 Apr 2020 12:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5EF3E6E454
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 12:50:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D73AD31B;
 Thu, 23 Apr 2020 05:50:08 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7E223F6CF;
 Thu, 23 Apr 2020 05:50:08 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 767A4682F3D; Thu, 23 Apr 2020 13:50:07 +0100 (BST)
Date: Thu, 23 Apr 2020 13:50:07 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [PATCH] drm/arm: cleanup coding style in arm a bit
Message-ID: <20200423125007.GG364558@e110455-lin.cambridge.arm.com>
References: <20200422021046.4375-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422021046.4375-1-bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmVybmFyZCwKCk9uIFR1ZSwgQXByIDIxLCAyMDIwIGF0IDA3OjEwOjQ2UE0gLTA3MDAsIEJl
cm5hcmQgWmhhbyB3cm90ZToKPiBGb3IgdGhlIGNvZGUgbG9naWMsIGFuIGFsYXJtIGlzIHRocm93
biBhZnRlciBmYWlsdXJlLCBidXQgdGhlCj4gY29kZSBjb250aW51ZXMgdG8gcnVuIGFuZCByZXR1
cm5zIHN1Y2Nlc3NmdWxseSwgc28gdG8gdGhlIGNhbGxlcgo+IHRoZSBpZiBjaGVjayBhbmQgcmV0
dXJuIGJyYW5jaCB3aWxsIG5ldmVyIHJ1bi4KPiBUaGUgY2hhbmdlIGlzIHRvIG1ha2UgdGhlIGNv
ZGUgYSBiaXQgbW9yZSByZWFkYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8g
PGJlcm5hcmRAdml2by5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfY3J0
Yy5jIHwgNCArLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9jcnRjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2NydGMuYwo+IGluZGV4IGFmNjdmZWZlZDM4ZC4u
MzJiZGExMzI1MGY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfY3J0
Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9jcnRjLmMKPiBAQCAtMTYwLDkg
KzE2MCw3IEBAIHN0YXRpYyB2b2lkIGhkbGNkX2NydGNfbW9kZV9zZXRfbm9mYihzdHJ1Y3QgZHJt
X2NydGMgKmNydGMpCj4gIAloZGxjZF93cml0ZShoZGxjZCwgSERMQ0RfUkVHX0hfU1lOQywgdm0u
aHN5bmNfbGVuIC0gMSk7Cj4gIAloZGxjZF93cml0ZShoZGxjZCwgSERMQ0RfUkVHX1BPTEFSSVRJ
RVMsIHBvbGFyaXRpZXMpOwo+ICAKPiAtCWVyciA9IGhkbGNkX3NldF9weGxfZm10KGNydGMpOwo+
IC0JaWYgKGVycikKPiAtCQlyZXR1cm47Cj4gKwloZGxjZF9zZXRfcHhsX2ZtdChjcnRjKTsKCkkg
dGhpbmsgeW91IGZvdW5kIGEgcmVhbCBidWcuIGhkbGNkX3NldF9weGxfZm10KCkgaXMgbm90IHN1
cHBvc2VkIHRvIHJldHVybiB6ZXJvIGlmCnRoZSBmb3JtYXQgaXMgbm90IHN1cHBvcnRlZCBhbmQg
aGVyZSB3ZSB3b3VsZCBzdG9wIGVuYWJsaW5nIHRoZSBwaXhlbCBjbG9jay4KCkRvIHlvdSBjYXJl
IHRvIHNlbmQgYSBwYXRjaCBmb3IgZml4aW5nIHRoZSBidWcsIHJhdGhlciB0aGFuIHRoaXMgb25l
PwoKQmVzdCByZWdhcmRzLApMaXZpdQoKPiAgCj4gIAljbGtfc2V0X3JhdGUoaGRsY2QtPmNsaywg
bS0+Y3J0Y19jbG9jayAqIDEwMDApOwo+ICB9Cj4gLS0gCj4gMi4yNi4yCj4gCgotLSAKPT09PT09
PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8Cnwg
YnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8K
ICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

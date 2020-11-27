Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9B02C6D6A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 23:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C5D6EE3C;
	Fri, 27 Nov 2020 22:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 588D66EE3C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 22:56:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 905A731B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 14:56:04 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70F373F71F;
 Fri, 27 Nov 2020 14:56:04 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 15859683244; Fri, 27 Nov 2020 22:56:03 +0000 (GMT)
Date: Fri, 27 Nov 2020 22:56:03 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: carsten.haitzler@foss.arm.com
Subject: Re: [PATCH] drm/komeda: Remove useless variable assignment
Message-ID: <20201127225603.GK1008493@e110455-lin.cambridge.arm.com>
References: <20201127110027.133569-1-carsten.haitzler@foss.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127110027.133569-1-carsten.haitzler@foss.arm.com>
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
Cc: Carsten Haitzler <carsten.haitzler@arm.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjcsIDIwMjAgYXQgMTE6MDA6MjdBTSArMDAwMCwgY2Fyc3Rlbi5oYWl0emxl
ckBmb3NzLmFybS5jb20gd3JvdGU6Cj4gRnJvbTogQ2Fyc3RlbiBIYWl0emxlciA8Y2Fyc3Rlbi5o
YWl0emxlckBhcm0uY29tPgo+IAo+IHJldCBpcyBub3QgYWN0dWFsbHkgcmVhZCBhZnRlciB0aGlz
IChvbmx5IHdyaXR0ZW4gaW4gb25lIGNhc2UgdGhlbgo+IHJldHVybmVkKSwgc28gdGhpcyBhc3Np
Z24gbGluZSBpcyB1c2VsZXNzLiBUaGlzIHJlbW92ZXMgdGhhdCBhc3NpZ25tZW50Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IENhcnN0ZW4gSGFpdHpsZXIgPGNhcnN0ZW4uaGFpdHpsZXJAYXJtLmNvbT4K
CkFja2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCkJlc3QgcmVnYXJk
cywKTGl2aXUKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5jIHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKPiBpbmRl
eCAxZDc2NzQ3M2JhOGEuLmVlYTc2ZjUxZjY2MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gQEAgLTE2Myw3ICsxNjMsNiBAQCBz
dGF0aWMgaW50IGtvbWVkYV9wYXJzZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBrb21l
ZGFfZGV2ICptZGV2KQo+ICAJcmV0ID0gb2ZfcmVzZXJ2ZWRfbWVtX2RldmljZV9pbml0KGRldik7
Cj4gIAlpZiAocmV0ICYmIHJldCAhPSAtRU5PREVWKQo+ICAJCXJldHVybiByZXQ7Cj4gLQlyZXQg
PSAwOwo+ICAKPiAgCWZvcl9lYWNoX2F2YWlsYWJsZV9jaGlsZF9vZl9ub2RlKG5wLCBjaGlsZCkg
ewo+ICAJCWlmIChvZl9ub2RlX25hbWVfZXEoY2hpbGQsICJwaXBlbGluZSIpKSB7Cj4gLS0gCj4g
Mi4yOS4yCj4gCgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8
IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAg
fAogXCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

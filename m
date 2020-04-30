Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF20C1BF70D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 13:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19D16EBA1;
	Thu, 30 Apr 2020 11:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A91A6EBA1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 11:45:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A8E91045;
 Thu, 30 Apr 2020 04:45:42 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BEDC3F305;
 Thu, 30 Apr 2020 04:45:42 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 232B0682B6F; Thu, 30 Apr 2020 12:45:41 +0100 (BST)
Date: Thu, 30 Apr 2020 12:45:41 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Ben Davis <ben.davis@arm.com>
Subject: Re: [PATCH v2] drm: drm_fourcc: Add uncompressed AFBC modifier
Message-ID: <20200430114541.GM1985@e110455-lin.cambridge.arm.com>
References: <20200430083220.17347-1-ben.davis@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430083220.17347-1-ben.davis@arm.com>
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
Cc: airlied@linux.ie, matteo.franchin@arm.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMzAsIDIwMjAgYXQgMDk6MzI6MjBBTSArMDEwMCwgQmVuIERhdmlzIHdyb3Rl
Ogo+IEFGQkMgaGFzIGEgbW9kZSB0aGF0IGd1YXJhbnRlZXMgdXNlIG9mIEFGQkMgd2l0aCBhbiB1
bmNvbXByZXNzZWQKPiBwYXlsb2Fkcywgd2UgYWRkIGEgbmV3IG1vZGlmaWVyIHRvIHN1cHBvcnQg
dGhpcyBtb2RlLgo+IAo+IFYyOiB1cGRhdGVkIG1vZGlmaWVyIGNvbW1lbnQKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBCZW4gRGF2aXMgPGJlbi5kYXZpc0Bhcm0uY29tPgoKQWNrZWQtYnk6IExpdml1IER1
ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgoKQmVzdCByZWdhcmRzLApMaXZpdQoKPiAtLS0KPiAg
aW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBp
L2RybS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+IGluZGV4
IDhiYzBiMzE1OTdkOC4uZWM0NmMyMzFhZjQzIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9k
cm0vZHJtX2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiBA
QCAtNzgwLDYgKzc4MCwxOCBAQCBleHRlcm4gIkMiIHsKPiAgICovCj4gICNkZWZpbmUgQUZCQ19G
T1JNQVRfTU9EX0JDSCAgICAgKDFVTEwgPDwgMTEpCj4gIAo+ICsvKiBBRkJDIHVuY29tcHJlc3Nl
ZCBzdG9yYWdlIG1vZGUKPiArICoKPiArICogSW5kaWNhdGVzIHRoYXQgdGhlIGJ1ZmZlciBpcyB1
c2luZyBBRkJDIHVuY29tcHJlc3NlZCBzdG9yYWdlIG1vZGUuCj4gKyAqIEluIHRoaXMgbW9kZSBh
bGwgc3VwZXJibG9jayBwYXlsb2FkcyBpbiB0aGUgYnVmZmVyIHVzZSB0aGUgdW5jb21wcmVzc2Vk
Cj4gKyAqIHN0b3JhZ2UgbW9kZSwgd2hpY2ggaXMgdXN1YWxseSBvbmx5IHVzZWQgZm9yIGRhdGEg
d2hpY2ggY2Fubm90IGJlIGNvbXByZXNzZWQuCj4gKyAqIFRoZSBidWZmZXIgbGF5b3V0IGlzIHRo
ZSBzYW1lIGFzIGZvciBBRkJDIGJ1ZmZlcnMgd2l0aG91dCBVU00gc2V0LCB0aGlzIG9ubHkKPiAr
ICogYWZmZWN0cyB0aGUgc3RvcmFnZSBtb2RlIG9mIHRoZSBpbmRpdmlkdWFsIHN1cGVyYmxvY2tz
LiBOb3RlIHRoYXQgZXZlbiBhCj4gKyAqIGJ1ZmZlciB3aXRob3V0IFVTTSBzZXQgbWF5IHVzZSB1
bmNvbXByZXNzZWQgc3RvcmFnZSBtb2RlIGZvciBzb21lIG9yIGFsbAo+ICsgKiBzdXBlcmJsb2Nr
cywgVVNNIGp1c3QgZ3VhcmFudGVlcyBpdCBmb3IgYWxsLgo+ICsgKi8KPiArI2RlZmluZSBBRkJD
X0ZPUk1BVF9NT0RfVVNNCSgxVUxMIDw8IDEyKQo+ICsKPiAgLyoKPiAgICogQXJtIDE2eDE2IEJs
b2NrIFUtSW50ZXJsZWF2ZWQgbW9kaWZpZXIKPiAgICoKPiAtLSAKPiAyLjI0LjAKPiAKCi0tIAo9
PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwg
IHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2Rl
ISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

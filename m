Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228E37627B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70D26ECFD;
	Fri, 26 Jul 2019 09:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4EF166E7B0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 16:58:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C98E919BF;
 Thu, 25 Jul 2019 09:58:31 -0700 (PDT)
Received: from [10.1.194.48] (e123572-lin.cambridge.arm.com [10.1.194.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FF8F3F71A;
 Thu, 25 Jul 2019 09:58:30 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: fast models: Increase clcd's
 max-memory-bandwidth
To: Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20190725145040.42182-1-kevin.brodsky@arm.com>
 <042d5c3d-96fe-5466-3869-a0a3a08b964d@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Message-ID: <1d7929a2-273e-e695-6700-36aacf38f61a@arm.com>
Date: Thu, 25 Jul 2019 17:58:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <042d5c3d-96fe-5466-3869-a0a3a08b964d@arm.com>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>,
 Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sudeep Holla <sudeep.holla@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDcvMjAxOSAxNjoxNSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IEhpIEtldmluLAoKSGkg
Um9iaW4sCgo+IE9uIDI1LzA3LzIwMTkgMTU6NTAsIEtldmluIEJyb2Rza3kgd3JvdGU6Cj4+IEl0
IG1heSBiZSBkZXNpcmFibGUgb24gY2VydGFpbiBwbGF0Zm9ybXMsIHN1Y2ggYXMgQW5kcm9pZCwg
dG8KPj4gdXNlIDMyYnBwIGJ1ZmZlcnMuIFNpbmNlIHRoZXJlIGlzIG5vIGNsZWFyIGJhbmR3aWR0
aCBsaW1pdCBmb3IgdGhlCj4+IENMQ0QgY29tcG9uZW50IG9uIHRoZSBmYXN0IG1vZGVsLCBsZXQn
cyBpbmNyZWFzZQo+PiBtYXgtbWVtb3J5LWJhbmR3aWR0aCB0byBhbGxvdyB1c2luZyAzMmJwcCBi
dWZmZXJzLgo+IEdpdmVuIHRoYXQgdGhlIHByb3BlcnR5IGlzIG9wdGlvbmFsIGFueXdheSwgd291
bGQgaXQgaHVydCB0byBqdXN0IHJlbW92ZQo+IGl0PyBBZnRlciB0cnlpbmcgdG8gZGlnIHVwIGFu
eSByZWxldmFudCBpbnRlcm5hbCBlbWFpbCBoaXN0b3J5LCBpdCdzCj4gc3RpbGwgZmFyIGZyb20g
Y2xlYXIgaG93IGFuZCB3aHkgaXQgZ290IGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlLgoKVmVyeSBn
b29kIHBvaW50LCBJIGhhZG4ndCByZWFsaXNlZCBpdCB3YXMgYW4gb3B0aW9uYWwgcHJvcGVydHku
IFJlbW92aW5nIGl0IApjb21wbGV0ZWx5IHNlZW1zIHRvIHdvcmsgZmluZS4gSSdsbCBzZW5kIGEg
djIgcmVtb3ZpbmcgaXQgZnJvbSBib3RoIGZ2cC1iYXNlLXJldmMuZHRzIAphbmQgcnRzbV92ZS1t
b3RoZXJib2FyZC5kdHNpLiBUaGFua3MhCgpLZXZpbgoKPiBSb2Jpbi4KPgo+PiBSZXBvcnRlZC1i
eTogUnViZW4gQXlyYXBldHlhbiA8cnViZW4uYXlyYXBldHlhbkBhcm0uY29tPgo+PiBTaWduZWQt
b2ZmLWJ5OiBLZXZpbiBCcm9kc2t5IDxrZXZpbi5icm9kc2t5QGFybS5jb20+Cj4+IC0tLQo+PiAg
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FybS9mdnAtYmFzZS1yZXZjLmR0cyB8IDIgKy0KPj4gICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FybS9mdnAtYmFzZS1yZXZjLmR0cyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYXJtL2Z2cC1iYXNlLXJldmMuZHRzCj4+IGluZGV4IDY4NzcwNzAyMGVj
MS4uM2FlZTQ5ZWQ2ZDg4IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FybS9m
dnAtYmFzZS1yZXZjLmR0cwo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FybS9mdnAtYmFz
ZS1yZXZjLmR0cwo+PiBAQCAtMjY5LDcgKzI2OSw3IEBACj4+ICAgIAkJbW90aGVyYm9hcmQgewo+
PiAgICAJCQlpb2ZwZ2FAMywwMDAwMDAwMCB7Cj4+ICAgIAkJCQljbGNkQDFmMDAwMCB7Cj4+IC0J
CQkJCW1heC1tZW1vcnktYmFuZHdpZHRoID0gPDEzMDAwMDAwMD47IC8qIDE2YnBwIEAgNjMuNU1I
eiAqLwo+PiArCQkJCQltYXgtbWVtb3J5LWJhbmR3aWR0aCA9IDwyNjAwMDAwMDA+OyAvKiAzMmJw
cCBAIDYzLjVNSHogKi8KPj4gICAgCQkJCX07Cj4+ICAgIAkJCX07Cj4+ICAgIAkJfTsKPj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

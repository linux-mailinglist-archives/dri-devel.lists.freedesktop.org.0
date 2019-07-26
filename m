Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D06578604
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE0F89A94;
	Mon, 29 Jul 2019 07:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EAA316ECFC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 09:50:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACF58344;
 Fri, 26 Jul 2019 02:50:28 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D5903F71A;
 Fri, 26 Jul 2019 02:50:27 -0700 (PDT)
Date: Fri, 26 Jul 2019 10:50:25 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Subject: Re: [PATCH v2] arm64: dts: fast models: Remove clcd's
 max-memory-bandwidth
Message-ID: <20190726095025.GB11177@e107155-lin>
References: <20190725171215.71801-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725171215.71801-1-kevin.brodsky@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
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
 dri-devel@lists.freedesktop.org, Sudeep Holla <sudeep.holla@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDY6MTI6MTRQTSArMDEwMCwgS2V2aW4gQnJvZHNreSB3
cm90ZToKPiBJdCBpcyB1bmNsZWFyIHdoeSBtYXgtbWVtb3J5LWJhbmR3aWR0aCBzaG91bGQgYmUg
c2V0IGZvciBDTENEIG9uIHRoZQo+IGZhc3QgbW9kZWwuIFJlbW92aW5nIHRoYXQgcHJvcGVydHkg
YWxsb3dzIGFsbG9jYXRpbmcgYW5kIHVzaW5nIDMyYnBwCj4gYnVmZmVycywgd2hpY2ggbWF5IGJl
IGRlc2lyYWJsZSBvbiBjZXJ0YWluIHBsYXRmb3JtcyBzdWNoIGFzCj4gQW5kcm9pZC4KPiAKPiBS
ZXBvcnRlZC1ieTogUnViZW4gQXlyYXBldHlhbiA8cnViZW4uYXlyYXBldHlhbkBhcm0uY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEtldmluIEJyb2Rza3kgPGtldmluLmJyb2Rza3lAYXJtLmNvbT4KPiAt
LS0KPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gUmVtb3ZlIHRoZSBhdHRyaWJ1dGUgY29tcGxldGVs
eSBpbnN0ZWFkIG9mIGluY3JlYXNpbmcgaXRzIHZhbHVlLiBJdCBpcwo+ICAgb3B0aW9uYWwgYW5k
IHRoZXJlIGlzIG5vIGNsZWFyIHJlYXNvbiB3aHkgaXQgc2hvdWxkIGJlIHNldCBhdCBhbGwuCj4g
Cj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYXJtL2Z2cC1iYXNlLXJldmMuZHRzICAgICAgICB8IDgg
LS0tLS0tLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9hcm0vcnRzbV92ZS1tb3RoZXJib2FyZC5k
dHNpIHwgMiAtLQoKSSB3YXMgYWJvdXQgdG8gYXNrIGFib3V0IHRoZSBhYm92ZSBmaWxlIGluIHYx
LCBhbmQgdGhlbiBzYXcgdjIuCkkgd2lsbCB0YWtlIHRoaXMgZm9yIHY1LjQuIFRoYW5rcwoKLS0K
UmVnYXJkcywKU3VkZWVwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==

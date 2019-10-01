Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 936EAC484B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CC36E8E9;
	Wed,  2 Oct 2019 07:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C5FA6E5BF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 09:00:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06850337;
 Tue,  1 Oct 2019 02:00:04 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5A0B3F739;
 Tue,  1 Oct 2019 02:00:02 -0700 (PDT)
Date: Tue, 1 Oct 2019 09:59:54 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: juno: add GPU subsystem
Message-ID: <20191001085954.GA10443@bogus>
References: <88dc6386929b3dcd7a65ba8063628c62b66b330c.1569856049.git.robin.murphy@arm.com>
 <CAL_JsqKUP6qG6PVL47RQ5A5OcBhpdOA_0VL1YeYDuyVSVcRqCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqKUP6qG6PVL47RQ5A5OcBhpdOA_0VL1YeYDuyVSVcRqCQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTI6NDY6MzNQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTA6MjUgQU0gUm9iaW4gTXVycGh5IDxyb2Jp
bi5tdXJwaHlAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gU2luY2Ugd2Ugbm93IGhhdmUgYmluZGlu
Z3MgZm9yIE1hbGkgTWlkZ2FyZCBHUFVzLCBsZXQncyB1c2UgdGhlbSB0bwo+ID4gZGVzY3JpYmUg
SnVubydzIEdQVSBzdWJzeXN0ZW0sIGlmIG9ubHkgYmVjYXVzZSB3ZSBjYW4uIEp1bm8gc3BvcnRz
IGEKPiA+IE1hbGktVDYyNCBpbnRlZ3JhdGVkIGJlaGluZCBhbiBNTVUtNDAwIChhcyBhIGdlc3R1
cmUgdG93YXJkcwo+ID4gdmlydHVhbGlzYXRpb24pLCBpbiB0aGVpciBvd24gZGVkaWNhdGVkIHBv
d2VyIGRvbWFpbiB3aXRoIERWRlMKPiA+IGNvbnRyb2xsZWQgYnkgdGhlIFNDUC4KPiA+Cj4gPiBD
QzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+Cj4gPiBDQzogU3VkZWVwIEhvbGxh
IDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KPiA+IENDOiBMb3JlbnpvIFBpZXJhbGlzaSA8bG9yZW56
by5waWVyYWxpc2lAYXJtLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYmluIE11cnBoeSA8cm9i
aW4ubXVycGh5QGFybS5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYmluZGluZ3MvZ3B1L2FybSxtYWxp
LW1pZGdhcmQueWFtbCAgICAgICAgfCAgNSArKystCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9h
cm0vanVuby1iYXNlLmR0c2kgICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKwo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IFJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKSWYgeW91IHBsYW4gdG8gdGFr
ZSBpdCBhbG9uZyB3aXRoIGRyaXZlciBjaGFuZ2UsCgpBY2tlZC1ieTogU3VkZWVwIEhvbGxhIDxz
dWRlZXAuaG9sbGFAYXJtLmNvbT4KCklmIG5vdCwgcGxlYXNlIGxldCB1cyBrbm93LiBJIGNhbiB0
YWtlIGl0IGZvciB2NS41CgotLQpSZWdhcmRzLApTdWRlZXAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

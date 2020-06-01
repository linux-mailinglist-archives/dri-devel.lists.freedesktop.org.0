Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B811EA885
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 19:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9876E071;
	Mon,  1 Jun 2020 17:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9B4F89FF7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 17:42:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E2BF55D;
 Mon,  1 Jun 2020 10:42:38 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B7A63F305;
 Mon,  1 Jun 2020 10:42:38 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id D0C50682B70; Mon,  1 Jun 2020 18:42:36 +0100 (BST)
Date: Mon, 1 Jun 2020 18:42:36 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/3] drm/arm: Kconfig annotate drivers as COMPILE_TEST
Message-ID: <20200601174236.GP159988@e110455-lin.cambridge.arm.com>
References: <20200517193655.3895087-1-emil.l.velikov@gmail.com>
 <20200518111043.GR159988@e110455-lin.cambridge.arm.com>
 <CACvgo50zr5WzgwE33Fa=BRc+AuBzg+OjxBTEMaQ5qt1SpW-D_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50zr5WzgwE33Fa=BRc+AuBzg+OjxBTEMaQ5qt1SpW-D_Q@mail.gmail.com>
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
Cc: Mali DP Maintainers <malidp@foss.arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbCwKCk9uIFdlZCwgTWF5IDIwLCAyMDIwIGF0IDEyOjU0OjE3QU0gKzAxMDAsIEVtaWwg
VmVsaWtvdiB3cm90ZToKPiBPbiBNb24sIDE4IE1heSAyMDIwIGF0IDEyOjEwLCBMaXZpdSBEdWRh
dSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gU3VuLCBNYXkgMTcsIDIw
MjAgYXQgMDg6MzY6NTNQTSArMDEwMCwgRW1pbCBWZWxpa292IHdyb3RlOgo+ID4gPiBBZGQgdGhl
IENPTVBJTEVfVEVTVCBjb25kaXRpb25hbCwgc28gdGhhdCBwZW9wbGUgY2FuIGF0IGxlYXN0IGJ1
aWxkIHRlc3QKPiA+ID4gdGhlIGRyaXZlcnMuCj4gPiA+Cj4gPiA+IENjOiBMaXZpdSBEdWRhdSA8
bGl2aXUuZHVkYXVAYXJtLmNvbT4KPiA+Cj4gPiBBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1
LmR1ZGF1QGFybS5jb20+Cj4gPgo+ID4gPiBDYzogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3Rhcmtl
eUBhcm0uY29tPgo+ID4gPiBDYzogTWFsaSBEUCBNYWludGFpbmVycyA8bWFsaWRwQGZvc3MuYXJt
LmNvbT4KPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gU2ln
bmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Cj4gPiA+
IC0tLQo+ID4gPiBQbGVhc2UgbWVyZ2UgdGhyb3VnaCB0aGUgQVJNIHRyZWUuCj4gPgo+ID4gV2Un
cmUgbm90IHVzaW5nIHRoZSBBUk0gdHJlZSBhbnltb3JlLCB3ZSBwdXNoIHBhdGNoZXMgdGhyb3Vn
aCBkcm0tbWlzYy4KPiA+Cj4gPiBJJ20gaGFwcHkgaWYgeW91IHdhbnQgdG8gcHVzaCB0aGUgd2hv
bGUgc2VyaWVzIG9yIEkgY2FuIGRvIHRoZSAyIHBhdGNoZXMKPiA+IHRoYXQgSSd2ZSBiZWVuIENj
LWVkIG9uLgo+ID4KPiBUaGUgdGhpcmQgcGF0Y2ggc2hvdWxkIGJlIHRha2VuIGNhcmUgb2YuIFNv
IDEvMyArIDIvMyBuZWVkIHRha2luZyBjYXJlIG9mLgo+IFBsZWFzZSBkbyBhIHF1aWNrIHJ1bnRp
bWUgdGVzdCBmb3IgMi8zLiBBcyB5b3UgY2FuIHNlZSBJJ3ZlIG9ubHkgY29tcGlsZWQgaXQuCgpG
b3IgMS8zICsgMi8zOgoKVGVzdGVkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNv
bT4KQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgoKQmVzdCByZWdh
cmRzLApMaXZpdQoKPiAKPiAtRW1pbAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBs
aWtlIHRvIHwKfCBmaXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5n
IG1lIHRoZSAgIHwKIFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xf
KOODhClfL8KvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

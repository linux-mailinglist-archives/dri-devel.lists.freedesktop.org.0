Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14905FEC32
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 13:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D84089DFA;
	Sat, 16 Nov 2019 12:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Sat, 16 Nov 2019 12:03:58 UTC
Received: from mail.blih.net (mail.blih.net [212.83.177.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E6D89DFA
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 12:03:57 +0000 (UTC)
Received: from mail.blih.net (mail.blih.net [212.83.177.182])
 by mail.blih.net (OpenSMTPD) with ESMTP id 4b3577f9;
 Sat, 16 Nov 2019 12:57:15 +0100 (CET)
Received: from sonic.home.blih.net (ip-9.net-89-3-105.rev.numericable.fr
 [89.3.105.9]) by mail.blih.net (OpenSMTPD) with ESMTPSA id 15830362
 TLS version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO;
 Sat, 16 Nov 2019 12:57:15 +0100 (CET)
Date: Sat, 16 Nov 2019 12:57:15 +0100
From: Emmanuel Vadot <manu@bidouilliste.com>
To: Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: drm core/helpers and MIT license
Message-Id: <20191116125715.0e83ce339c421465fa00266e@bidouilliste.com>
In-Reply-To: <f6629560-6b95-c125-a1d5-51554b2a1dab@tronnes.org>
References: <20191114200132.GA11077@SDF.ORG> <20191115123432.GB1208@intel.com>
 <f6629560-6b95-c125-a1d5-51554b2a1dab@tronnes.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; amd64-portbld-freebsd13.0)
Mime-Version: 1.0
X-Mailman-Original-DomainKey-Signature: a=rsa-sha1; c=nofws; d=bidouilliste.com;
 h=date
 :from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; q=dns; s=
 mail; b=ducWZ1O2Ay/wePwAN0eCz+S70yUkFxTRcVtBsAxxQDZEb2jQAysWjpCm
 VycU0mneYl5MhT6d5rCaDFFZwblX6B78VxC7aHPkZuYOMjVei1YsO4YxIEolYBcw
 hiN7GqDOxNBVVQsr/Xt4X7dE9EvueGHwMXym9bxBCOTf4hIBQig=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha1; c=relaxed;
 d=bidouilliste.com; h=date
 :from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=mail;
 bh=um4BBdT4YZ0Jp3uYL1FQm1jmWsA=; b=doMJsGupN16HGxbiYV+Q7uOZcy4K
 v5QI+o/mo0zGdCnSPrXW54xoEppHlyBLkfs06oC0uU89qlt+L2TXDzZ6yvoLBiuN
 FHGkRZEJ2WraqfyNVQAMzeAbfHALC/ODa+a5T/ismdSVUt5IjM4WlIUH7IsiVgTi
 UeGsqc7JN6zipko=
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
Cc: daniel.vetter@ffwll.ch, coypu@sdf.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNSBOb3YgMjAxOSAxNTozMzo0NiArMDEwMApOb3JhbGYgVHLDuG5uZXMgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4gd3JvdGU6Cgo+IAo+IAo+IERlbiAxNS4xMS4yMDE5IDEzLjM0LCBza3Jl
diBWaWxsZSBTeXJqw6Rsw6Q6Cj4gPiBPbiBUaHUsIE5vdiAxNCwgMjAxOSBhdCAwODowMTozMlBN
ICswMDAwLCBjb3lwdUBzZGYub3JnIHdyb3RlOgo+ID4+IEhpIERhbmllbCwKPiA+Pgo+ID4+IEkg
ZG9uJ3QgdGhpbmsgd2UgY2FuIG1ha2UgYW55IGNvbXBsYWludHMgYWJvdXQgR1BMIGJlaW5nIG1v
cmUgd2lkZWx5Cj4gPj4gdXNlZCBpbiB0aGUgRFJNIGNvZGUuIEl0J3MgbmljZSB0byBoYXZlIHRo
ZSBjb2RlIGF0IGFsbCwgdGhlIE1JVCBsaWNlbnNlCj4gPj4gaXMgYSBib251cy4gVGhhbmtzIGZv
ciB3cml0aW5nIGl0IGFuZCBiZWFyaW5nIHdpdGggdXMuCj4gPj4KPiA+PiBXb3VsZCByZXdyaXRl
cyBkb25lIHB1cmVseSBmb3IgbGljZW5zaW5nIHJlYXNvbnMgYmUgYWNjZXB0ZWQgdXBzdHJlYW0/
Cj4gPiAKPiA+IFJld3JpdGUgc2hvdWxkIGJlIHRoZSBsYXN0IHJlc29ydC4gSSB0aGluayBhIGxv
dCBvZiB0aGUgR1BMIG9ubHkgc3R1ZmYKPiA+IGlzIHF1aXRlIHJlY2VudCBzbyB0aGVyZSdzIGEg
Z29vZCBjaGFuY2UgdGhlIGF1dGhvcihzKSBhcmUgc3RpbGwgYXJvdW5kCj4gPiB0byBkaXNjdXNz
IHJlbGljZW5zaW5nLgo+ID4gCj4gCj4gSWYgc29tZW9uZSBzZW5kcyBwYXRjaGVzIHRvIE1JVCBs
aWNlbnNlIHRoZSB3b3JrIEkndmUgZG9uZSwgSSdsbCBiZQo+IGhhcHB5IHRvIGFjayBpdC4gSXQn
cyBvbmx5IHJlY2VudGx5IHRoYXQgSSd2ZSBiZWVuIGF3YXJlIG9mIHRoZSBmYWN0Cj4gdGhhdCBN
SVQgbGljZW5zZWQgd2FzIGEgdGhpbmcgaW4gdGhlIGtlcm5lbC4gSSB3YXMgdW5kZXIgdGhlIGlt
cHJlc3Npb24KPiB0aGF0IGFsbCBuZXcgY29kZSBzaG91bGQgYmUgR1BMIGFuZCBNSVQgd2VyZSBm
b3IgY29kZSBpbXBvcnRlZCBmcm9tCj4gZWxzZXdoZXJlLiBJIHdvdWxkIGxvdmUgdG8gc2VlIG15
IHdvcmsgYmVpbmcgdXNlZCBvbiB0aGUgQlNEJ3MuCgogQW5kIEkgd291bGQgbG92ZSB0byBiZSBh
YmxlIHRvIHVzZSB5b3VyIHdvcmsgb24gRnJlZUJTRCA6KQogSSBkb24ndCByZWFsbHkga25vdyB0
aGUgcnVsZXMgYnV0IHNob3VsZG4ndCB5b3Ugc2VuZCBhIHBhdGNoIHRvCnJlbGljZW5jZSA/CiBS
aWdodCBub3cgZm9yIG1lIGRybV9jbGllbnQgKGFuZCBvdGhlcnMpIGJlaW5nIEdQTCBpcyBhIHBy
b2JsZW0gZm9yIG15CnVwZGF0ZSBvZiBEUk0gaW4gRnJlZUJTRCBzbyBJJ20gbm90IHVzaW5nIGl0
ICh3aGljaCBpcyBiYWQgYW5kIHdpbGwKcHJvYmFibHkgY2F1c2UgcHJvYmxlbXMpLgoKPiBOb3Jh
bGYuCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
CgotLSAKRW1tYW51ZWwgVmFkb3QgPG1hbnVAYmlkb3VpbGxpc3RlLmNvbT4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 398D7187983
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 07:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5C56E02B;
	Tue, 17 Mar 2020 06:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E746E04A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 06:21:57 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id r7so20596683oij.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 23:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VXWGyQJxDmE99LUJEVQT7BWXF6cJoiWoNrGsLOgPad8=;
 b=GxT4Iy6f/IPnnMoyws5fB/pUQXp/LsO0vCgA/rnmhwj09tv1l2Tf61bxyHgfRcMgPi
 JwnZHGr3qYxZwRgZi3Vf10Ud1m3t+/Mpet64W86N+Iq6HL0ETfkAO5QJ8x23xO46wYS6
 MK6SRZoXAI52u9xsgfqnZvuqKGXffi+gNQZgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VXWGyQJxDmE99LUJEVQT7BWXF6cJoiWoNrGsLOgPad8=;
 b=tnlgHL1VQoB/vv+2GVfDmFhj3iluPx3leQ0taiiB9GJK25RbT6ebYIsZUu/ck2GBt/
 3Sv5943u9OxXCE+z7plM+mtKGlgi6Abm88Nf0GG8vxVuXsRyGYC702kaDCXu0feQ5HeJ
 chbPmy/dobnoVfuTRJrulpguk88XKGxOSLWCZVsrW++TJPCpCLPie7/F5KFY7ePsoBOV
 H0a6mdFNa9u68HoDe6ryUluiP5ZbHbn1zzoT6zSqqViClzmJ5S3EaQD5d/5wW9v62lMz
 Ra977FQld+WwLdOjRjtVA8TSnPXh1+CXrojU8LKQxVrqx2Jki2Psc7z79icHSneCsTAw
 fM1Q==
X-Gm-Message-State: ANhLgQ0a0JavxJhcWO213AU4b92Zug3zielHDvoiyRT9PUWLeeDRONOr
 VgvClTOY+9+MJ4b35I37H+aAWwK+A81aZXQ4WW+04Q==
X-Google-Smtp-Source: ADFU+vsfxYRWNNDbNpIAHp7NKnbbe64I3YgtgQf7rrIFJPTrUdeJAiccz0lYCV2gQp216haFSy1Jgcf9oj7ID4Y52lg=
X-Received: by 2002:aca:d11:: with SMTP id 17mr2426323oin.128.1584426116640;
 Mon, 16 Mar 2020 23:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uFO26eeXdr+Um+fwKO4_UvVHX-KueUt=x_omXOqDPhBZw@mail.gmail.com>
In-Reply-To: <CAKMK7uFO26eeXdr+Um+fwKO4_UvVHX-KueUt=x_omXOqDPhBZw@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 17 Mar 2020 07:21:45 +0100
Message-ID: <CAKMK7uE-1RHp7EKUxPuYiiBGQvThF1=Z=KC8CcSuf987Pb6eYw@mail.gmail.com>
Subject: Re: 2020 X.Org Board of Directors Elections Nomination period is NOW
To: Xorg Members List <members@x.org>
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
Cc: Mesa Dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBhIHF1aWNrIHJlbWluZGVyIHRoYXQgYm90aCBib2FyZCBub21pbmF0aW9uIGFuZCBtZW1i
ZXJzaGlwCnJlbmV3YWwgcGVyaW9kcyBhcmUgc3RpbGwgb3BlbmluZzoKCi0gU2VuZCBib2FyZCBu
b21pbmF0aW9ucyB0byBlbGVjdGlvbnMgQVQgeCBET1Qgb3JnCgotIEdvdCB0byBodHRwczovL21l
bWJlcnMueC5vcmcvIHRvIHJlbmV3IHlvdXIgbWVtYmVyc2hpcCAob3IgYmVjb21lCm9uZSB0byBi
ZWdpbiB3aXRoISkKCkNoZWVycywgRGFuaWVsCgpPbiBTdW4sIE1hciA4LCAyMDIwIGF0IDg6NTEg
UE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBXZSBh
cmUgc2Vla2luZyBub21pbmF0aW9ucyBmb3IgY2FuZGlkYXRlcyBmb3IgZWxlY3Rpb24gdG8gdGhl
IFguT3JnCj4gRm91bmRhdGlvbiBCb2FyZCBvZiBEaXJlY3RvcnMuIEFsbCBYLk9yZyBGb3VuZGF0
aW9uIG1lbWJlcnMgYXJlCj4gZWxpZ2libGUgZm9yIGVsZWN0aW9uIHRvIHRoZSBib2FyZC4KPgo+
IE5vbWluYXRpb25zIGZvciB0aGUgMjAyIGVsZWN0aW9uIGFyZSBub3cgb3BlbiBhbmQgd2lsbCBy
ZW1haW4gb3Blbgo+IHVudGlsIDIzOjU5IFVUQyBvbiAyOXRoIE1hcmNoIDIwMjAuCj4KPiBUaGUg
Qm9hcmQgY29uc2lzdHMgb2YgZGlyZWN0b3JzIGVsZWN0ZWQgZnJvbSB0aGUgbWVtYmVyc2hpcC4g
RWFjaAo+IHllYXIsIGFuIGVsZWN0aW9uIGlzIGhlbGQgdG8gYnJpbmcgdGhlIHRvdGFsIG51bWJl
ciBvZiBkaXJlY3RvcnMgdG8KPiBlaWdodC4gVGhlIGZvdXIgbWVtYmVycyByZWNlaXZpbmcgdGhl
IGhpZ2hlc3Qgdm90ZSB0b3RhbHMgd2lsbCBzZXJ2ZQo+IGFzIGRpcmVjdG9ycyBmb3IgdHdvIHll
YXIgdGVybXMuCj4KPiBUaGUgZGlyZWN0b3JzIHdobyByZWNlaXZlZCB0d28geWVhciB0ZXJtcyBz
dGFydGluZyBpbiAyMDE5IHdlcmVTYW11ZWwKPiBJZ2xlc2lhcyBHb25zw6FsdmV6LCBNYW5hc2kg
RCBOYXZhcmUsIEx5dWRlIFBhdWwgYW5kIERhbmllbCBWZXR0ZXIuCj4gVGhleSB3aWxsIGNvbnRp
bnVlIHRvIHNlcnZlIHVudGlsIHRoZWlyIHRlcm0gZW5kcyBpbiAyMDIxLiBDdXJyZW50Cj4gZGly
ZWN0b3JzIHdob3NlIHRlcm0gZXhwaXJlcyBpbiAyMDIwIGFyZSBFcmljIEFuaG9sdCwgIEJyeWNl
Cj4gSGFycmluZ3RvbiwgS2VpdGggUGFja2FyZCBhbmQgSGFycnkgV2VudGxhbmQuCj4KPiBBIGRp
cmVjdG9yIGlzIGV4cGVjdGVkIHRvIHBhcnRpY2lwYXRlIGluIHRoZSBmb3J0bmlnaHRseSBJUkMg
bWVldGluZwo+IHRvIGRpc2N1c3MgY3VycmVudCBidXNpbmVzcyBhbmQgdG8gYXR0ZW5kIHRoZSBh
bm51YWwgbWVldGluZyBvZiB0aGUKPiBYLk9yZyBGb3VuZGF0aW9uLCB3aGljaCB3aWxsIGJlIGhl
bGQgYXQgYSBsb2NhdGlvbiBkZXRlcm1pbmVkIGluCj4gYWR2YW5jZSBieSB0aGUgQm9hcmQgb2Yg
RGlyZWN0b3JzLgo+Cj4gQSBtZW1iZXIgbWF5IG5vbWluYXRlIHRoZW1zZWx2ZXMgb3IgYW55IG90
aGVyIG1lbWJlciB0aGV5IGZlZWwgaXMKPiBxdWFsaWZpZWQuIE5vbWluYXRpb25zIHNob3VsZCBi
ZSBzZW50IHRvIHRoZSBFbGVjdGlvbiBDb21taXR0ZWUgYXQKPiBlbGVjdGlvbnMgYXQgeC5vcmcu
Cj4KPiBOb21pbmVlcyBzaGFsbCBiZSByZXF1aXJlZCB0byBiZSBjdXJyZW50IG1lbWJlcnMgb2Yg
dGhlIFguT3JnCj4gRm91bmRhdGlvbiwgYW5kIHN1Ym1pdCBhIHBlcnNvbmFsIHN0YXRlbWVudCBv
ZiB1cCB0byAyMDAgd29yZHMgdGhhdAo+IHdpbGwgYmUgcHJvdmlkZWQgdG8gcHJvc3BlY3RpdmUg
dm90ZXJzLiBUaGUgY29sbGVjdGVkIHN0YXRlbWVudHMsCj4gYWxvbmcgd2l0aCB0aGUgc3RhdGVt
ZW50IG9mIGNvbnRyaWJ1dGlvbiB0byB0aGUgWC5PcmcgRm91bmRhdGlvbiBpbgo+IHRoZSBtZW1i
ZXIncyBhY2NvdW50IHBhZ2Ugb24gaHR0cDovL21lbWJlcnMueC5vcmcsIHdpbGwgYmUgbWFkZQo+
IGF2YWlsYWJsZSB0byBhbGwgdm90ZXJzIHRvIGhlbHAgdGhlbSBtYWtlIHRoZWlyIHZvdGluZyBk
ZWNpc2lvbnMuCj4KPiBOb21pbmF0aW9ucywgbWVtYmVyc2hpcCBhcHBsaWNhdGlvbnMgb3IgcmVu
ZXdhbHMgYW5kIGNvbXBsZXRlZAo+IHBlcnNvbmFsIHN0YXRlbWVudHMgbXVzdCBiZSByZWNlaXZl
ZCBubyBsYXRlciB0aGFuIDIzOjU5IFVUQyBvbiAwMgo+IEFwcmlsIDIwMjAuCj4KPiBUaGUgc2xh
dGUgb2YgY2FuZGlkYXRlcyB3aWxsIGJlIHB1Ymxpc2hlZCA2IEFwcmlsIDIwMjAgYW5kIGNhbmRp
ZGF0ZQo+IFEmQSB3aWxsIGJlZ2luIHRoZW4uIFRoZSBkZWFkbGluZSBmb3IgWG9yZyBtZW1iZXJz
aGlwIGFwcGxpY2F0aW9ucyBhbmQKPiByZW5ld2FscyBpcyAwMiBBcHJpbCAyMDIwLgo+Cj4gQ2hl
ZXJzLCBEYW5pZWwsIG9uIGJlaGFsZiBvZiB0aGUgWC5PcmcgQm9ECj4KPiBQUzogSSBjYydlZCB0
aGUgdXN1YWwgZGV2IGxpc3RzIHNpbmNlIG5vdCBtYW55IG1lbWJlcnMgcHV0IGluIHRoZSByZW5l
d2FsIHlldC4KPiAtLQo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KPiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNo
CgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

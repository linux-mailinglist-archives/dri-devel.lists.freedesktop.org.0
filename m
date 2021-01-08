Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4AB2EF821
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 20:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9D86E8B0;
	Fri,  8 Jan 2021 19:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82CC6E8AF;
 Fri,  8 Jan 2021 19:30:16 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id l200so12538561oig.9;
 Fri, 08 Jan 2021 11:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hN2mkgW+HJphhCKWgvIr/dGOdsF108ttuU4ip9XRMCc=;
 b=iqNOXjpcMMp9uJQmHyaNujkntxNSOUyuvx9xYyHtzaREYqpXYl2OrhSrjii/mZeucB
 XevzIO4jv7UQYNEwrnBqX+cV8uUGjo3TBxa81fCtog9I+fItgx0/lwI/XQSCoJ72shS0
 yXqfRkb07pwwWZcAGP0VTPlibRTVMEEd01S74mBd9jExxmevCvidMJtlH3Eb7JMeXp67
 lsz6ahcCaEq9qWS7I64Ctn/tYFIJbIGuO/80/xzaS4b82A8914LmmGaRSl4v4k3FHXbj
 Psa+NX4ooz7ZWX/FSudGC6C8zCgkyltZWqW6qyaoHW4sdaxZ5Aunju1yMYT9E9edf9RX
 z7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hN2mkgW+HJphhCKWgvIr/dGOdsF108ttuU4ip9XRMCc=;
 b=SsMKW8dBVovy8+IL84YLMLN3GseMRcUN31CKc+1yqs24RPksgPS/Sx9NeOfpvjxfP8
 oISWXmcFNnQNbyVPE5aXgoM77OCvMcz/Fm0Lkj1QIoLx0liAeZfjFyvRiSzSsZGGN2IL
 qg/+QLiig02/RYcNdeYIRePnH1vBcPf+Mv8FKYpm3t2KXvBPZ8OCWA+sUh1jtGSbuBxB
 XREmPkfdTw8nmrTj6cgZah8o/03+UBLQQP7DKHr8wPNRWPd9C3bsbJLM3DR40GmOx+/a
 DkaweBgrdr3scDrt/XXN0Ac2H8KcIyN74A0WK1DB0dnlRKN/uEG0uDA+gYm+bCg/2ntC
 2F4g==
X-Gm-Message-State: AOAM531UTCHnBUA+VG4nzinnClrKrTmU6aqVeCQmdea3EXdRBVyyZS1B
 NE5jSSnbVXttdfkMO23DIL9HtICeRiF4nRQTivBowcPR
X-Google-Smtp-Source: ABdhPJwbeH/EoTAZkuPYmubT5MG0J9FNPXPeTTnaNOPe+OSXJU1qVcTib8QpQTC7ftqpXQDMZkoEec0MW/rp6aNnY2U=
X-Received: by 2002:aca:4f97:: with SMTP id d145mr3278933oib.123.1610134216205; 
 Fri, 08 Jan 2021 11:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20210105201548.1374211-1-alexander.deucher@amd.com>
In-Reply-To: <20210105201548.1374211-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 14:30:05 -0500
Message-ID: <CADnq5_OSJQEOOF3N5Z3uX1LY=p0xHJYAukPNj7kGn06teJG5Gw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update radeon/amdgpu/amdkfd git trees
To: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKYW4gNSwgMjAyMSBhdCAzOjE1IFBNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJA
Z21haWwuY29tPiB3cm90ZToKPgo+IEZETyBpcyBvdXQgb2Ygc3BhY2UsIHNvIG1vdmUgdG8gZ2l0
bGFiLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgoKUGluZz8gIEFueSBvYmplY3Rpb25zPwoKQWxleAoKPiAtLS0KPiAgTUFJTlRBSU5F
UlMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXgg
ZWIxODQ1OWMxZDE2Li5lMjg3N2JlNmIxMGQgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiAr
KysgYi9NQUlOVEFJTkVSUwo+IEBAIC05MDcsNyArOTA3LDcgQEAgQU1EIEtGRAo+ICBNOiAgICAg
RmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4gIEw6ICAgICBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ICBTOiAgICAgU3VwcG9ydGVkCj4gLVQ6ICAgICBnaXQg
Z2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXgKPiArVDogICAgIGdpdCBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvYWdkNWYvbGludXguZ2l0Cj4gIEY6ICAgICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkKi5bY2hdCj4gIEY6ICAgICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC8KPiAgRjogICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
aW5jbHVkZS9jaWtfc3RydWN0cy5oCj4gQEAgLTE0NTk2LDcgKzE0NTk2LDcgQEAgTTogICAgICBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gIE06ICAgICBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gIEw6ICAgICBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+ICBTOiAgICAgU3VwcG9ydGVkCj4gLVQ6ICAgICBnaXQgZ2l0
Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXgKPiArVDogICAgIGdpdCBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvYWdkNWYvbGludXguZ2l0Cj4gIEY6ICAgICBkcml2
ZXJzL2dwdS9kcm0vYW1kLwo+ICBGOiAgICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi8KPiAgRjog
ICAgIGluY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCj4gLS0KPiAyLjI5LjIKPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

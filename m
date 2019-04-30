Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45496F9CD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 15:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19AA891C4;
	Tue, 30 Apr 2019 13:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C52891C4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 13:21:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s15so20958505wra.12
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 06:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vK2/hchHjhzWyqSrfXYvD8HlaXYE6xU5oBiYQgmiN7U=;
 b=B05/0jshfUu5/YgvFpu5aloUr6HjuBjQ8wD4bZxdHl4QHUE5nyKxogBX6ngGtoOZwI
 HjeWlYhwCJzseIinBX7+59ovKjo/iEyINhx3K60icer/TxrO+wUeWZQlWDVnbVlGEZbn
 q2EoFi2SZ77dwOSawwXiSKtfTGebPrsd4FOcnfPX6h3lHUNyGZ6wyeafy9MB+Uclkv9E
 /ML0sE1QGnon8UcRpLM7ZnIlarMbfs63rBPF/fG9DZx3vbbYnEmXj6fezjU+ylqiGnWc
 avDoByfZPewrSGrjzU1deXDiATfHpo4kwKUkRH/XcPbpGRE6IEurfY52SihQqqsW9Dtw
 v+Ug==
X-Gm-Message-State: APjAAAVWcQJ2HVt0svow45R9zPACApedcpjy+sgvBFdPGDVTSU1s+G8A
 bLyxGUWnkHO95mv8JO5e60gjOLA7GmnGbCeuGnw=
X-Google-Smtp-Source: APXvYqwxTiE1jBUzPC66SubSAnOx3W0vG7cD/kA6GBZaoVM2B0nOyU8Kv/XWlKTxsyh9lMkyzOXFiOkN697QlYvekc4=
X-Received: by 2002:adf:f606:: with SMTP id t6mr2296528wrp.128.1556630477402; 
 Tue, 30 Apr 2019 06:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190430094125.6272-1-christian.koenig@amd.com>
In-Reply-To: <20190430094125.6272-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 30 Apr 2019 09:21:04 -0400
Message-ID: <CADnq5_NGRDO1ombRYifStCsOhYt5uRSDKjJmNgv-i2ET=Yw_qg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: drop Jerry as TTM maintainer
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vK2/hchHjhzWyqSrfXYvD8HlaXYE6xU5oBiYQgmiN7U=;
 b=agJyqO6eq8T6DySpafvYtp1ISvaMqpRms7RYwrYQde+HSHbDdOLPb3XMne6eci67fr
 L/G+yewLrY6nZDIlk009BfEi6do6zEAqcfsVtaJriE5BbOzRV41M0Qtu/bImJ1RLtHI6
 /T40nwpV3qNiA4XUaXWyRnWpKNTuWmfzhUJs/SfzE6EN1Und43ySUtQ7DvhTv7sdSgVw
 KOmtEYEMMfzN/aWJDCSki5hBHS2ntBvqHBdKimyjRSlvw1V+ncTZ3U/oBz3G0vkdqZ2r
 pN2XAINe6zbfF/UtTTsGIL/4FsBKRv3EyzVtjtnQUgMdpKY/Rf4h8bgBTW5nibrStdTJ
 wtVg==
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgNTo0MSBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIZSB1bmZvcnR1bmF0ZWx5IGRv
ZXNuJ3Qgd29yayBmb3IgQU1EIGFueSBtb3JlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKQWNrZWQtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCj4gLS0tCj4gIE1BSU5UQUlORVJTIHwgMSAt
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvTUFJTlRB
SU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IDNkMTk5NTkyZmQyYy4uYzUyYTlmNWI5ZmU0IDEw
MDY0NAo+IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtNTM2OSw3
ICs1MzY5LDYgQEAgRjogICAgICAgIERvY3VtZW50YXRpb24vZ3B1L3hlbi1mcm9udC5yc3QKPiAg
RFJNIFRUTSBTVUJTWVNURU0KPiAgTTogICAgIENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiAgTTogICAgIEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+Cj4g
LU06ICAgICBKdW53ZWkgWmhhbmcgPEplcnJ5LlpoYW5nQGFtZC5jb20+Cj4gIFQ6ICAgICBnaXQg
Z2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXgKPiAgUzogICAgIE1haW50
YWluZWQKPiAgTDogICAgIGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiAtLQo+IDIu
MjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

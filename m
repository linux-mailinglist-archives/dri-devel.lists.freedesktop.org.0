Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9EF15078
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 17:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B344B89A91;
	Mon,  6 May 2019 15:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C4089A91
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 15:42:00 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p21so16361258wmc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 08:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MYcaFgKn6ECEPLvOspXg+Eb2Qdg5LB6npoqI96Q+peM=;
 b=XjE+vPWCFU+9iAVnxX7H0VHpWcTGscMaD22sIbJztz1oF0c9Gu6TNAo/ni1NcJ2Niy
 czWZ3oNkiGkhyZaam1/o33A4fW0R8dzR9xi7UG4rdK1B47V4eKRz15pocM4hNhoUYIqI
 nymkykxG/4XWWY6fjZoSeogRW+EXYwd/NkQW2y2EP7+biEPOGC/V9r7ri1HahhCzAFAB
 KUb47ibdTO+3xaxRHcAzCMIwiD+orOS3pj53l4jaH2LgMk0LaJAPBIpYgUZlqs34vk7i
 Ly7Nr1wx/uhlccJyGIUNVWxI/yZIMykG+qsaF/quxV6iZSV+dCUiGsVkQxDekNoZEDH4
 91/Q==
X-Gm-Message-State: APjAAAUpb+/ByzSK+1t2qtHfVXhO/CVwZPFA8qE7NCJvtBPPZClPp0W7
 ykwrWeDWe9gZhdZcsTbTRYn2AHThAmh5P6+IRDk=
X-Google-Smtp-Source: APXvYqyIOjZltG7P9RFpfYTjjUIc1r0Nt/M/duwjHxxO1kI2B0WZc8553TB1kD5AIsSGEb7YZqmiKjMa4sisySczNIM=
X-Received: by 2002:a7b:c256:: with SMTP id b22mr447007wmj.0.1557157319207;
 Mon, 06 May 2019 08:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190503080408.7799-1-oded.gabbay@gmail.com>
 <20190503080408.7799-2-oded.gabbay@gmail.com>
In-Reply-To: <20190503080408.7799-2-oded.gabbay@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 May 2019 11:41:45 -0400
Message-ID: <CADnq5_NUNMhhE8tXWbiyszojOrYnRfS9Mc1+3yHYxkV0ZZmNHg@mail.gmail.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: update amdkfd maintainer
To: Oded Gabbay <oded.gabbay@gmail.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MYcaFgKn6ECEPLvOspXg+Eb2Qdg5LB6npoqI96Q+peM=;
 b=i/x1Y3uIOSlCm8VZwOnXBN/9Vbu59CR5koWZ5dASWshbipLPcDc25UVEIl3WYlNTNO
 Js7zGeif+nFC+ASeblA920XMxvKgnaMhZnW8H6EicESWognLb9zMFQ2QJOkqnhnFZhUB
 OlTNM3rJHTWFNyhvOMqkaxPO2pJhixWX/wBIMqKL2LK1GlHDdUgE4hEwk6a89IDFUIlc
 d95RZx26SljxdtbmU/jD6HYhxcwl6S7M77Z033J5+/Fzr3RzerVXD3BIo0mNQLhEnuL8
 K74UuyOEltzfJwgcs9A/+Fhd8NjR+HGlEgb6ixJHDp935OZ15i8bcyMU2gn4szohYOKQ
 7FEA==
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

T24gRnJpLCBNYXkgMywgMjAxOSBhdCA0OjA0IEFNIE9kZWQgR2FiYmF5IDxvZGVkLmdhYmJheUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gYW1ka2ZkIGlzIG5vdyBiZWluZyB1cHN0cmVhbWVkIHRvZ2V0
aGVyIHdpdGggdGhlIGFtZGdwdSBkcml2ZXIuIFRoZXJlZm9yZSwKPiB1cGRhdGUgdGhlIG1haW50
YWluZXIgZW50cnkgZm9yIHRoZSBkcml2ZXIgd2l0aCB0aGUgbmFtZSBvZiB0aGUgYW1kZ3B1Cj4g
ZHJpdmVyIG1haW50YWluZXIuCj4KCldlIHVzZSBvbmUgdHJlZSwgYnV0IEZlbGl4IGlzIHRoZSBt
YWludGFpbmVyLiAgU2hvdWxkIHByb2JhYmx5IHB1dCBoaW0KcmF0aGVyIHRoYW4gbWUuCgpBbGV4
Cgo+IFNpZ25lZC1vZmYtYnk6IE9kZWQgR2FiYmF5IDxvZGVkLmdhYmJheUBnbWFpbC5jb20+Cj4g
LS0tCj4gIE1BSU5UQUlORVJTIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUwo+IGluZGV4IDVjMzhmMjFhZWU3OC4uMzc5ODI0N2QwMmM2IDEwMDY0NAo+IC0tLSBh
L01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtNzk4LDkgKzc5OCw5IEBAIEY6
ICBkcml2ZXJzL2lvbW11L2FtZF9pb21tdSouW2NoXQo+ICBGOiAgICAgaW5jbHVkZS9saW51eC9h
bWQtaW9tbXUuaAo+Cj4gIEFNRCBLRkQKPiAtTTogICAgIE9kZWQgR2FiYmF5IDxvZGVkLmdhYmJh
eUBnbWFpbC5jb20+Cj4gK006ICAgICBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNv
bT4KPiAgTDogICAgIGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiAtVDogICAgIGdp
dCBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35nYWJiYXlvL2xpbnV4LmdpdAo+ICtUOiAg
ICAgZ2l0IGdpdDovL3Blb3BsZS5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4Cj4gIFM6ICAg
ICBTdXBwb3J0ZWQKPiAgRjogICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmQuYwo+ICBGOiAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZC5oCj4gLS0KPiAyLjE3LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

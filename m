Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63578B3DC8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 17:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DD26E296;
	Mon, 16 Sep 2019 15:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D4D6E296
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 15:38:20 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8FC5A80478;
 Mon, 16 Sep 2019 17:38:16 +0200 (CEST)
Date: Mon, 16 Sep 2019 17:38:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v5 0/8] add driver for boe, tv101wum-nl6, boe,
 tv101wum-n53, auo, kd101n80-45na and auo, b101uan08.3 panels
Message-ID: <20190916153815.GA20997@ravnborg.org>
References: <20190916022941.15404-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190916022941.15404-1-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=t5GJ4r0l-SeTeGRPmjgA:9 a=CjuIK1q_8ugA:10 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSml0YW8uCgo+IENoYW5nZXMgc2luY2UgdjQ6CgpZb3UgYXJlIGhpdCBieSBzb21lIG9mIHRo
ZSBwcm9ncmVzcyBtYWRlIGluIHRoZSBrZXJuZWwuCk5ldyBkaXNwYWx5IGJpbmRpbmdzIGFyZSBw
cmVmZXJyZWQgdG8gYmUgaW4gbWV0YS1zY2htYSBmb3JtYWwgKC55YW1sCmZpbGVzKS4KVGhpcyBh
bGxvd3MgbW9yZSBmb3JtYWxzIGNoZWNrcyBhbmQgdGhpcyBpcyB0aGUgZm9ybWF0IHRoYXQgd2UK
aG9wZSBhbGwgZGlzcGxheSBiaW5kaWducyB3aWxsIG1pZ3JhdGUgb3ZlciB0byB1c2Ugb25jZQpz
b21lb25lIHN0ZXBzIHVwIGFuZCBkbyBhIG1hc3MgY29udmVyc2lvbi4KClRoaXMgaXMgYSBiaXQg
ZXh0cmEgd29yayBub3csIGJ1dCBtdWNoIGJldHRlciB0byBoYXZlIGl0IGRvbmUKYnkgc29tZW9u
ZSB3aG8ga25vd3MgdGhlIEhXLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=

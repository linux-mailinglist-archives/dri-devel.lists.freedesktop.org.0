Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4F23BD59
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 22:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACD189130;
	Mon, 10 Jun 2019 20:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D39889130;
 Mon, 10 Jun 2019 20:13:15 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 992FD804C9;
 Mon, 10 Jun 2019 22:13:11 +0200 (CEST)
Date: Mon, 10 Jun 2019 22:13:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v1 0/7] drm/radeon: drop obsolete header files
Message-ID: <20190610201310.GA17483@ravnborg.org>
References: <20190608080241.4958-1-sam@ravnborg.org>
 <CADnq5_M-qKGuRy_KOP9u=ps1yVgtuF16cyXHe82WkHcmMfs+rw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_M-qKGuRy_KOP9u=ps1yVgtuF16cyXHe82WkHcmMfs+rw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=zd2uoN0lAAAA:8
 a=eNpKU4bnIex2C86qoi0A:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleC4KCj4gCj4gU2VyaWVzIGlzOgo+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gCj4gRmVlbCBmcmVlIHRvIHRha2UgaXQgdGhyb3Vn
aCBkcm0tbWlzYyBpZiB5b3Ugd2FudCwgb3RoZXJ3aXNlLCBsZXQgbWUKPiBrbm93IGFuZCBJJ2xs
IHRha2UgaXQgdGhyb3VnaCBteSB0cmVlLgoKQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LgpJIGhh
ZCBhY2NpZGVudGx5IGxlZnQgYSBmZXcgZW1wdHkgbGluZXMgdGhhdCBjaGVja3BhdGNoIGNvbXBs
YWluZWQKYWJvdXQuIEkgZml4ZWQgdGhlc2Ugd2hlbiBJIGFwcGxpZWQgdGhlIHBhdGNoZXMuCgpX
aWxsIHB1c2ggaXQgYWZ0ZXIgaXkgcGFzc2VzIG15IGZpbmFsIHByZS1wdXNoIGJ1aWxkIHRlc3Rz
LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B5F10F233
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 22:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E797E6E34A;
	Mon,  2 Dec 2019 21:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5773E6E34A;
 Mon,  2 Dec 2019 21:31:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s14so1164394wmh.4;
 Mon, 02 Dec 2019 13:31:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zycfz/fltNjwNJCKwHtS1/dslZ9HHioet7o+SNO2dSk=;
 b=L74QLHgo1jaOjFpwAxLJgAK0oXJJncjrH6knYqRdPY6kuW1cft7WAb6QKjT8q/4Nyh
 yQtgvxYDstAXDukr485UoNLrkveP3ABBmF0HPa0JckdC2eEzxQF+he2JlFByyeE5S6EC
 78Nt9Tbfk3fjAR1gNFBwn21SX6JlRkV1oJokUbVBa/ClAiCG9e57MPBEnlfHYz96L49G
 grFZd3aHQ1aYeukYWmNfSYypIbRfOwhCbjtSxLjLnYl2i/svMY0TUr0cwxzmfDyim1CL
 w/fZz7NMbY6R1VONtG+urlhBe+z9FrlIJCN2SdvsX/P4VLOlURvXEozpOn13Nw20BVB5
 DtmA==
X-Gm-Message-State: APjAAAUOxds1RajKrVZKfMmNwQkNSBmVb8EfYvHD6o3HYSQEBtIM7Aqu
 44EWH5jrwPF6ZdSa3uaJrYg/gAsI9RAECsEmEOQ=
X-Google-Smtp-Source: APXvYqwjfm+6FL2lka6ugfRgKUTTq3dtH1mRYJOP9BXtpe5mE1wcfzuA2vdWsPPg8sLYuz1GXYFaksgzGLSIpwqEZNs=
X-Received: by 2002:a7b:c1d3:: with SMTP id a19mr32263175wmj.127.1575322305937; 
 Mon, 02 Dec 2019 13:31:45 -0800 (PST)
MIME-Version: 1.0
References: <1574908300-126787-1-git-send-email-zhengbin13@huawei.com>
 <d007a0ff-6298-93d0-7af2-289582927332@amd.com>
In-Reply-To: <d007a0ff-6298-93d0-7af2-289582927332@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Dec 2019 16:31:33 -0500
Message-ID: <CADnq5_ONj+4m=FyOZ9eCSp4RHy-DamJb9=ufA_iS+7yde2W7zQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/amd/display: Remove unneeded semicolon
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zycfz/fltNjwNJCKwHtS1/dslZ9HHioet7o+SNO2dSk=;
 b=prsjiL7iIPCKp60AXWNKQzycLOAhhfCWDcu+IGjziQHpebUnBWjefZIRfYlvgZfZSA
 QhTyTRVdx+USklQeSWl25iSiQX7umOUDkZ8yBDJtwG5Od2R2NbZqrLuE5POlvKlVLn/S
 Mh3ze3OTB0pOgqu/KQPZHCINN0irrIbJYfYW6fR+g6HIURhYf7s+S2Ndo0R5kpD25jGH
 ST+zxjUEq2dFF1NEzMbE80yV2AVJSnU9zW9rlbYiLRnIaGkDYAui/MFodj1q3hFbyZdo
 Q9WNRM5Pu662+Sq9uXz/7CgjzKg5p5wMhQeyX9EPgG70x48bLkhJh+8ozTzsKSmMcgKb
 jB8Q==
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, zhengbin <zhengbin13@huawei.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZCB0aGUgc2VyaWVzLiAgVGhhbmtzIQoKQWxleAoKT24gVGh1LCBOb3YgMjgsIDIwMTkg
YXQgOTo0NiBBTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4gd3JvdGU6Cj4KPiBT
ZXJpZXMgaXMKPiBSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFt
ZC5jb20+Cj4KPiBIYXJyeQo+Cj4gT24gMjAxOS0xMS0yNyA5OjMxIHAubS4sIHpoZW5nYmluIHdy
b3RlOgo+ID4gemhlbmdiaW4gKDQpOgo+ID4gICBkcm0vYW1kL2Rpc3BsYXk6IFJlbW92ZSB1bm5l
ZWRlZCBzZW1pY29sb24gaW4gYmlvc19wYXJzZXIuYwo+ID4gICBkcm0vYW1kL2Rpc3BsYXk6IFJl
bW92ZSB1bm5lZWRlZCBzZW1pY29sb24gaW4gYmlvc19wYXJzZXIyLmMKPiA+ICAgZHJtL2FtZC9k
aXNwbGF5OiBSZW1vdmUgdW5uZWVkZWQgc2VtaWNvbG9uIGluIGhkY3AuYwo+ID4gICBkcm0vYW1k
L2Rpc3BsYXk6IFJlbW92ZSB1bm5lZWRlZCBzZW1pY29sb24gaW4gZGlzcGxheV9ycV9kbGdfY2Fs
Y18yMS5jCj4gPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2Jpb3Nf
cGFyc2VyLmMgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyMi5jICAgICAgICAgICAgICAgIHwgMiArLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGNuMjEvZGlzcGxheV9ycV9kbGdf
Y2FsY18yMS5jIHwgNCArKy0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVs
ZXMvaGRjcC9oZGNwLmMgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiAgNCBmaWxlcyBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gLS0KPiA+IDIuNy40
Cj4gPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

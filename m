Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F2F1C9B9F
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 22:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E013C6EA5E;
	Thu,  7 May 2020 20:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8936EA5E;
 Thu,  7 May 2020 20:05:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k1so7905849wrx.4;
 Thu, 07 May 2020 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CrYfmmSwv+JySTyTYwGzP2iBGkWHIZBd7bjrJC5ooVc=;
 b=osxF1l8Nx4lZFIAChlc6L3qMDyZ32oexH7aQ5H/ozgPRyD2CaTJTecQT36EDvb0lwD
 7YpJRF3A40V4hV8WEmSMACWcLU5zAZlYT7YjqoVjRNgFlsz0K4hh00alVMMk4PVKkKCE
 GfTnfl9kxlANmoR/tQQr+lyzXAW3xT7NipidNGuM/RF0EODE8j5gfja7SSqfHYwfLkcu
 hv0CJyyzrXwyMvgutYdPr8XtlrqrhK/me9eT61vy+3MjEXwyAiQYzkmddcXujVydav66
 72CNA9OFnrjdHGL55IdU97XFvJLi5YgH6nHfdf3RDqRADGVVOkp+MySeEWYyfPWkwFxG
 tiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CrYfmmSwv+JySTyTYwGzP2iBGkWHIZBd7bjrJC5ooVc=;
 b=QcW3/Iq0FtR2XkGSYcJzEyhJeqrzu1HZRQ8uByT1bDn/0OP3bZdGQP/BXbKoSAoEKW
 dSE9ZOhuLnarJtEDvmh5DvIo1/tBCTmHn7Tew33BG6YLtg1kmkys4cRxg+sPGruUgzn2
 f+sHdhOHKSHmFlH0Onp8crzQR3XF2V9GtgKZohT7b+YAan6wl3o42UsPnDykdgFOZ/Vl
 Qq2Dsx4kV+zYGUUnCKO2BczdcBWlPMGCvpRqpfT256UVNroZAoYlPVhv+10i+IoHkJpp
 0ugcdHDGnglAwS/iqQEe5569zsf4/ZjisIAJminz18s2Cto/oFTrZeSpWIXrI9WAyEN+
 L0aw==
X-Gm-Message-State: AGi0Puahe9GnAuh3rRQW0Hu6ivM8U0vbi2lpURoZd1qCT7QY+5jNkiSt
 lNAnGT5RKChIWVl0xEPAdHgWt2o/9E0OwJr/7yo=
X-Google-Smtp-Source: APiQypKloJvDW14eWF4gCoWbXMu1WfPb9WxaMArtA+pDH2xRdXOog0Feqr5WQ78mR9b9awpNJJkchQroNzVAvOy5rsA=
X-Received: by 2002:adf:fa91:: with SMTP id h17mr753982wrr.111.1588881945532; 
 Thu, 07 May 2020 13:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200507020221.10548-1-david1.zhou@amd.com>
 <cbbcc5b3-8860-6f44-b8ec-dd96eece6d7c@gmail.com>
In-Reply-To: <cbbcc5b3-8860-6f44-b8ec-dd96eece6d7c@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 May 2020 16:05:33 -0400
Message-ID: <CADnq5_POGStjWKyWs6cR7Frj6NK49Gc79SHBEJEj4Xk8q2B=NA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove me from amdgpu maintainers
To: Christian Koenig <christian.koenig@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIFRodSwgTWF5IDcsIDIwMjAgYXQgMjo0NSBBTSBD
aHJpc3RpYW4gS8O2bmlnCjxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6
Cj4KPiBBbSAwNy4wNS4yMCB1bSAwNDowMiBzY2hyaWViIENodW5taW5nIFpob3U6Cj4gPiBHbGFk
IHRvIHNwZW5kIHRpbWUgb24ga2VybmVsIGRyaXZlciBpbiBwYXN0IHllYXJzLgo+ID4gSSd2ZSBt
b3ZlZCB0byBuZXcgZm9jdXMgaW4gdW1kIGFuZCBjb3VsZG4ndCBjb21taXQKPiA+IGVub3VnaCB0
aW1lIHRvIGRpc2N1c3Npb25zLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3Ug
PGRhdmlkMS56aG91QGFtZC5jb20+Cj4KPiBTbyBMb25nLCBhbmQgVGhhbmtzIGZvciBBbGwgdGhl
IEZpc2ggOikKPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4KPiA+IC0tLQo+ID4gICBNQUlOVEFJTkVSUyB8IDEgLQo+ID4gICAxIGZp
bGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVS
UyBiL01BSU5UQUlORVJTCj4gPiBpbmRleCA5MzgzMTYwOTI2MzQuLjRjYTUwOGJkNGM5ZSAxMDA2
NDQKPiA+IC0tLSBhL01BSU5UQUlORVJTCj4gPiArKysgYi9NQUlOVEFJTkVSUwo+ID4gQEAgLTE0
MDY2LDcgKzE0MDY2LDYgQEAgRjogICAgZHJpdmVycy9uZXQvd2lyZWxlc3MvcXVhbnRlbm5hCj4g
PiAgIFJBREVPTiBhbmQgQU1ER1BVIERSTSBEUklWRVJTCj4gPiAgIE06ICBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiAgIE06ICBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiAtTTogICBEYXZpZCAoQ2h1bk1pbmcpIFpob3Ug
PERhdmlkMS5aaG91QGFtZC5jb20+Cj4gPiAgIEw6ICBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+ID4gICBTOiAgU3VwcG9ydGVkCj4gPiAgIFQ6ICBnaXQgZ2l0Oi8vcGVvcGxlLmZyZWVk
ZXNrdG9wLm9yZy9+YWdkNWYvbGludXgKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK

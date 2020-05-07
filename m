Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7821C82C6
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 08:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837FE6E919;
	Thu,  7 May 2020 06:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CA26E918;
 Thu,  7 May 2020 06:45:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z6so5395700wml.2;
 Wed, 06 May 2020 23:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Vn/vveKlvySB9XxMV28Az/Ep0ciQxNGMNQwBH9YWdlg=;
 b=VDFb0vzq5SdJAY9E3zMp6nnsusI1p2/cbJLkrlkCWMDaWsNgP+5tUSOjwnM7orvXaf
 aUwLYqEC9K2P9VEiiDUpdGJ+az14I9TZa7RueRZJHclV1vjzr0llneHwT/uSzuATeGn4
 JGO6r6oGfJfRGCol3tO8u/HrH3mJtCZHkfe09gEBgL5xRmiclzXWg4hfCdxwDeNG7TxX
 Uag2+evyR1ToMhfrAqxGr0HSd0zLELpser+sn8J4SH3OcXri5S7JG3WbFpxMR/Mf7bSV
 /vHslYpGayD+qjqS/WUFSByg98+oPjma9nVkNR/ljPCeURYcvJFfSd8HEnbnOCqMtzBv
 0HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Vn/vveKlvySB9XxMV28Az/Ep0ciQxNGMNQwBH9YWdlg=;
 b=S452j62rxsBUrX1tn0bf34X4aGYGlpLVCgY8QrB6tJIxCC0QUkX5d0uQf3W/O5yL6/
 wL1K+csif7eFQT/ORXOqt8omNEc0xFOciBeJyl+5zaWt9tLxdrIA1MaMKAXz7LhaLvfw
 4H1anC16ZJcVObKUs5OyCnSF2v8K644EHCy4q3MPUwitFawaX+6su4YAzWLWdaHd03wJ
 iryTGkleQMpHGyo8gGYr3zr6ocWau3iAZeIf3q6vNOeJtsm/Y9VDEUPqeumXCRLF1ol7
 zsqWhigJllQcbG89Qpy31AYGZ4X3WQUpeQedD+WMpnUlAyR1j3RSJ/9LkTcIMc6otiMR
 ftog==
X-Gm-Message-State: AGi0PuaHMKl3G/w4EYO9A4l4dS3bd83wofggq0hVEc0s7l2yODUupmSu
 BvG+MPPPURVfzTxvULEk7wo=
X-Google-Smtp-Source: APiQypK4SnZ4NEsSfsb3uUEBwqOjdX+gwSq29JuMft0fgLKO2Z0P7hpsDlheMG5rU6sixNqj0eRZXg==
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr3000672wmc.41.1588833954085; 
 Wed, 06 May 2020 23:45:54 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id u2sm7670328wrd.40.2020.05.06.23.45.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 May 2020 23:45:53 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Remove me from amdgpu maintainers
To: Chunming Zhou <david1.zhou@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20200507020221.10548-1-david1.zhou@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cbbcc5b3-8860-6f44-b8ec-dd96eece6d7c@gmail.com>
Date: Thu, 7 May 2020 08:45:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200507020221.10548-1-david1.zhou@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, Christian.Koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDUuMjAgdW0gMDQ6MDIgc2NocmllYiBDaHVubWluZyBaaG91Ogo+IEdsYWQgdG8gc3Bl
bmQgdGltZSBvbiBrZXJuZWwgZHJpdmVyIGluIHBhc3QgeWVhcnMuCj4gSSd2ZSBtb3ZlZCB0byBu
ZXcgZm9jdXMgaW4gdW1kIGFuZCBjb3VsZG4ndCBjb21taXQKPiBlbm91Z2ggdGltZSB0byBkaXNj
dXNzaW9ucy4KPgo+IFNpZ25lZC1vZmYtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFt
ZC5jb20+CgpTbyBMb25nLCBhbmQgVGhhbmtzIGZvciBBbGwgdGhlIEZpc2ggOikKClJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+
ICAgTUFJTlRBSU5FUlMgfCAxIC0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IDkzODMxNjA5
MjYzNC4uNGNhNTA4YmQ0YzllIDEwMDY0NAo+IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIvTUFJ
TlRBSU5FUlMKPiBAQCAtMTQwNjYsNyArMTQwNjYsNiBAQCBGOglkcml2ZXJzL25ldC93aXJlbGVz
cy9xdWFudGVubmEKPiAgIFJBREVPTiBhbmQgQU1ER1BVIERSTSBEUklWRVJTCj4gICBNOglBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gICBNOglDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gLU06CURhdmlkIChDaHVuTWluZykgWmhv
dSA8RGF2aWQxLlpob3VAYW1kLmNvbT4KPiAgIEw6CWFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gICBTOglTdXBwb3J0ZWQKPiAgIFQ6CWdpdCBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Au
b3JnL35hZ2Q1Zi9saW51eAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==

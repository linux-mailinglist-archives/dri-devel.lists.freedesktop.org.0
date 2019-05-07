Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF84166CE
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 17:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E93E6E7ED;
	Tue,  7 May 2019 15:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x131.google.com (mail-it1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D41B6E7EC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 15:34:16 +0000 (UTC)
Received: by mail-it1-x131.google.com with SMTP id q132so11919666itc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 08:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0FONh4RR3YVsXTz7fwMu/xzw1qnFzRajcgJyAHcTV2M=;
 b=TbTfhRbLEhUZDMs9xTSbMMMc8a5TxauJkPrNiHLUUsqF2WP28+1VJd0d6DK/H2Pyju
 AXmHg926QYFRMQzIZUYyG1FlU9nSW8SP9q+LIu4LnNgHRDKTHd7AdRQnoGjezJ6jpEr2
 qH70aQEkTsEzYUawoLuDxErDqxQ7qMoftUUHxdHAwKZkXWxIhNZD1it3k1vXtubGZNz/
 cz9ED4Y9LgkBX0EOVzQ5xr+Qi6ALM9cnw7G/MoHTNdWxAVClylbwmGlnlJIoUFeJOdEN
 q2Rm5zBgr7jWOsP2pEqakGZpvAi7btgkYRpRWx27l9wQi+2rE9rFnVxsgb+cYaTX8oJ2
 vDvQ==
X-Gm-Message-State: APjAAAWFh6PGiZ1cLxP1XZ/UxvBmgyfiMWH9eblTTIfZ6Xyno4jroex/
 BpTTiywyZT9he670IAc0bN0NcvGED+V+xi/IeYa63DBU
X-Google-Smtp-Source: APXvYqwrqfMNxzr/17zrxAJ+ZaUlkDxDgPEGbsJn3Ul1A/Rc6jF8u32ZKO72vBnVyq0y27wqBGSOF3APjgFjUKaUMew=
X-Received: by 2002:a24:39c6:: with SMTP id l189mr24061510ita.51.1557243255750; 
 Tue, 07 May 2019 08:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAKzjFstQdAM8tY-8YhF5HDtoZGMcuJnRXYQswnwgsnyvAbKR7A@mail.gmail.com>
In-Reply-To: <CAKzjFstQdAM8tY-8YhF5HDtoZGMcuJnRXYQswnwgsnyvAbKR7A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 7 May 2019 17:34:04 +0200
Message-ID: <CAKMK7uEFBJ=2O7aBE2=UdGrZSEku9Yvx8ABqiB2JsY=XwEgxzg@mail.gmail.com>
Subject: Re: XORG Endless Vacation of Code
To: Karthik Guru <karth251998@gmail.com>, events@lists.x.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0FONh4RR3YVsXTz7fwMu/xzw1qnFzRajcgJyAHcTV2M=;
 b=BInCQrwDMVKrVZ97xfak65lwkcL7fWS3DPQW1Vy0f8mRcNVT1Fpe4Nve1bpKCcu1O6
 +HZvh1Ec9SuOxP/2rweRb+pdyos7wkMwvV/gmP58OKfDkXbOYctvRB+BRslCYK7DW+kC
 p2vHMwMXNAWoInZSMTS4EFSLH4EfsqqgINVfM=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkaW5nIGV2b2MgbGlzdC4KLURhbmllbAoKT24gVHVlLCBNYXkgNywgMjAxOSBhdCAzOjI4IFBN
IEthcnRoaWsgR3VydSA8a2FydGgyNTE5OThAZ21haWwuY29tPiB3cm90ZToKPgo+IEhleQo+Cj4g
Q291bGQgeW91IHBsZWFzZSB0ZWxsIG1lIGlmIGFwcGxpY2F0aW9ucyBhcmUgb3BlbiBmb3IgWE9S
RyBFVk9DPwo+Cj4gQWxzbywgd2hhdHMgdGhlIHByb2NlZHVyZSBmb3Igd3JpdGluZyBhIHByb3Bv
c2FsIGZvciBhbnkgb2YgdGhlIHByb2plY3RzCj4KPiBUaGFua3MhCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0
OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==

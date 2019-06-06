Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7730D37A0D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 18:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5035892F6;
	Thu,  6 Jun 2019 16:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9904E892F6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 16:51:30 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id bh12so1156669plb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 09:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=aa8v2Ry0AgUyHqDSDkVaopTmArzSQkUiolk4pn2d3+s=;
 b=bzcwNbFUolW0rfaqDsAt3A3iz2IxmuwALLz/8kgganNueniHHTTXTa4E0MdxWNwgAY
 P5YWAFDhtlvRlL19FHGYa/c1iyIAE/zJDg94BBcg8+ROZgy3ne53KrOl8nVp/JdHjgns
 pgMAkpkQ+695dntIEjnetLdoE8bRP2c1EDyw32NJcOSmLbg92riZIMTFAh29HN+C2K0/
 3DbcXEWVlRlV+muOdUo0xoVBAwMTXC9Jkj6ZQmGrHqnqqtfh+Zx2QCTThM7Jz9NUB8mC
 ouY0Cvi0lCto2A9M/4GmD3IFa1Qj49WWdj5igWVEeMTPVgEGt3eh7euo5Pday/9n0gYi
 4Vzw==
X-Gm-Message-State: APjAAAUrQYhFV591RJIvdqrrxnrzd/VD04IMTYNN98DdXNZYldsF1uc7
 knp2ywmFxXcTNJEX59pPjKBG9Q==
X-Google-Smtp-Source: APXvYqwf3kWtPMwOnmP7ZZOYSimryM81jqIIaWq+An6NiWUG8IxZBgCpaGSayfH926J5f/CiXcB0PA==
X-Received: by 2002:a17:902:b18f:: with SMTP id
 s15mr52670524plr.44.1559839890184; 
 Thu, 06 Jun 2019 09:51:30 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id r77sm2336028pgr.93.2019.06.06.09.51.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 09:51:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/meson: update with SPDX Licence identifier
In-Reply-To: <20190520142927.1009-1-narmstrong@baylibre.com>
References: <20190520142927.1009-1-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 09:51:27 -0700
Message-ID: <7hef46fyi8.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=aa8v2Ry0AgUyHqDSDkVaopTmArzSQkUiolk4pn2d3+s=;
 b=DaczKw269EV7LA54BQf75jZoNq5u89tfhtV1e6vBRU8zQDjavkM/B5+S8OlIYrhtBu
 zRH8KJfNZ6SVzujhafnICd+ZNaQPV4/8QuIo358hspBB/EagYVbB+x62egPUDT/JhNKv
 9e3V3l9q2a6BMyCyYGBeVLCvjHYdIr3XNvYQzsTbFciUxEEFGrpz5QhM2uEJlBQ5y4I1
 fPVGsCzLhzuSHn1Zj4OR7+kgIkt3FlwF/jdEnwlTk8YmlFaNX1Vtsk+Um1u8sd0cdumd
 b2KlyDEjmllwz6zSkUx/JA10Cfu3DmLno0xnQJLKue+RN9jjE86nky1JRkl7usEyBaZ8
 cEow==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IFNpZ25l
ZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KClJldmll
d2VkLWJ5OiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

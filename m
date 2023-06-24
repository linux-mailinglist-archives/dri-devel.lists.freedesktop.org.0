Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47B573CFB3
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 11:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFAB10E144;
	Sun, 25 Jun 2023 09:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDED10E077
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 19:19:46 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f86dbce369so2383550e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 12:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=en.cx; s=google; t=1687634383; x=1690226383;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fd3319PTnlYUlr+14oGdxlXbigX6EztZJpgTUSZoE2E=;
 b=WGUyo9a5WKHdNUFwARsxvYU+y/kD4eY7zHO7Lwb2/1Pl3btUub3O0TlvoBSK4AMCKh
 zb3NX2f7OedpOBZm3Fz1VMCx6HzWHwV1CUGq3dp1zbA767savNSZtDCiXQvsCpsNY7cv
 IhZaaOV+rcqJZtyReo7wF8vUh8PfL0yWT7Fe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687634383; x=1690226383;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fd3319PTnlYUlr+14oGdxlXbigX6EztZJpgTUSZoE2E=;
 b=AtuQKl+wlVfW1s98JNnxHPNrXmDA1P3/K+xc/eEgPMLrTc7Z/Esn0x51mAc/bd8Kag
 2dkn4A0DO/um9btcWJpJUxtlPYQuE2QNTiVdLiRGg0bFhwFUKER4sLWGKEAd50We1/xT
 a+iEgZIirqUSjVHYBFFBsIhZYa6C/77fAEy2+Kpsx+D7IkhNoPizpB1UajJ65dx79cly
 UdA3kJgHJxmP9R6hFbmJ+TYeXLqPo4B0D50st3aa66VHGhOaYWwlLbI9QHaf8luFBCND
 52Oqfgb08Hc7vpyaFul3udLI8QtwFGTpnp1hxgWQG7GAPxVo9z+hJFcHEUfbR0zclMjp
 5Pkg==
X-Gm-Message-State: AC+VfDzvkGqVD+QojTAp92wq85+y4/VbcTAj0IlcowRj1IjwwdMXYczU
 RiX7f19RpBLThhlWj7xBe7GFFk4ioJsA5fB1Sj46x1sdruObx3E1eic=
X-Google-Smtp-Source: ACHHUZ5m06OKgevZHKH3sg/bNgrxHUW56ydj4xMw/ybPMQKiii4OujSmjZwKVtlxCPX7DB4JRzyV0AOoniTKJz8KKNc=
X-Received: by 2002:a19:ca50:0:b0:4f8:578f:ace1 with SMTP id
 h16-20020a19ca50000000b004f8578face1mr13396270lfj.21.1687634382608; Sat, 24
 Jun 2023 12:19:42 -0700 (PDT)
MIME-Version: 1.0
From: Nikita Vostokov <beewosk@pnz.en.cx>
Date: Sat, 24 Jun 2023 22:19:31 +0300
Message-ID: <CAMVWf1mhcbG7+rK-KHYN7qqgi+LLph_dgvVgcttNgfBWQgsvCw@mail.gmail.com>
Subject: Add me to Developer group
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 25 Jun 2023 09:26:15 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

I want to contribute to the modetest tool a few patches, which I had
developed during my work.
https://gitlab.freedesktop.org/mesa/mesa/-/issues/9197#note_1958102

Best regards,
Vostokov Nikita

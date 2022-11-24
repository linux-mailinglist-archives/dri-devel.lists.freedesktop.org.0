Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C00D6373EB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 09:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF9510E6A5;
	Thu, 24 Nov 2022 08:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36D210E0C7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 04:27:57 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 w15-20020a17090a380f00b0021873113cb4so602044pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 20:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lF+fs2TxmoRHTOtN9oU3oCuS2GdCf/nQl1e3bcrvH14=;
 b=kHDoXogxFvr0DDf1OFDdKLMZvnrap8zTsot73+0R6n9fVnPYPefxps3joQYhRGKBqO
 onXk6Grcq8vT7ZmR+r/JOe8MUF/+7Jbkdaq4TDLqNFv64nji20OBvWgbgMMIxyYebuGD
 gcpOaA09Be6mf/9wBhTG2FthlZbhSp0a3eZZzTBt3L1TSRkDNoiWvHlnthpKNxDmsVfi
 yU+cXI58X2/HLKWSbjvLIZvlATgKa8Cg6eIyczhd8W4vtY4akzrHyZZpHirIvLxaDfpR
 x+BL1Ltn5wndwfDo6RkXDKN89hQz95P6evt9+ue4ybYwkoi+m20UuFXA0jqjPW2Aknlu
 /BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lF+fs2TxmoRHTOtN9oU3oCuS2GdCf/nQl1e3bcrvH14=;
 b=y6zvEFSN/RB5m3Dg9FC6ATWheZJnIwbDPhf5wiH47PEDHRJahZ0+kRzslN06bzq0jI
 0Reiemdmu2U3tucLpCCiNxiACkB7eFdwGPOQG5wZPjEtyeBR/RzxqekR0EkR+gdvyQDO
 lKb9G9RYJIwHUnv+K+QHH4Eahuk4M3y/8giT8dyhMjFo+u8nRhH30/qJIwmuTEUKyJ9U
 cAlS7vDIvIdKfcioEw6oYwxGCpRnmGc34rS9eveSXsINvViBfsYM6pT7XHDtvY7XRxXz
 BTsWAXyhGioeshLOTuWB+XTMM2FxodRd4aQ6TbCWweByYY69gYlJdTyHx9JEzuE5euFb
 1PJg==
X-Gm-Message-State: ANoB5pkK49EQfL3RzIh+rChZmmnnkDynzNuAh2Cuw6D5zRFcQozcwrr0
 XuUPNoaiBkvLeE6y/t3AunvFRKL/3ktw5dMMHaBsvvFYgzc=
X-Google-Smtp-Source: AA0mqf5tbJgOUNjjfJvLL6M1ywky3nzxZmgcuQANYbN05Q556KdSIEyy+A5zcQqQH0GRSoUKadgNJT9MpOqcASDqe7U=
X-Received: by 2002:a17:903:3311:b0:188:5242:3b00 with SMTP id
 jk17-20020a170903331100b0018852423b00mr12591929plb.68.1669264077122; Wed, 23
 Nov 2022 20:27:57 -0800 (PST)
MIME-Version: 1.0
From: Shams Ahmad m Sami <shamsahmadms@gmail.com>
Date: Thu, 24 Nov 2022 07:27:45 +0300
Message-ID: <CAA_KKGZ32k8ZemB8K39FD2qL9P+6etfJDLG55Nd-=Y29ezXzYQ@mail.gmail.com>
Subject: Re: [RFC v2 README 00/13] DRM scheduling cgroup controller
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000005a71da05ee2fd4c3"
X-Mailman-Approved-At: Thu, 24 Nov 2022 08:30:00 +0000
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

--0000000000005a71da05ee2fd4c3
Content-Type: text/plain; charset="UTF-8"

Help

--0000000000005a71da05ee2fd4c3
Content-Type: text/html; charset="UTF-8"

Help

--0000000000005a71da05ee2fd4c3--

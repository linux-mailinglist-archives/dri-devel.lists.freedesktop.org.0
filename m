Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA471703E42
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 22:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A267B10E268;
	Mon, 15 May 2023 20:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23FA10E269
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 20:11:05 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1D5C01F9B2;
 Mon, 15 May 2023 22:11:03 +0200 (CEST)
Date: Mon, 15 May 2023 22:11:01 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v8 5/8] drm/msm/dpu: add support for DSC encoder v1.2
 engine
Message-ID: <pialfld7v3azuochoynb37wqp3mroewa64c7rhcpnii277te5q@pso5q7dhyfqk>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-6-git-send-email-quic_khsieh@quicinc.com>
 <41243dc6-eb9d-dea6-f945-cb1f6594a2a4@linaro.org>
 <w6uswjuf7fiorrplqzhrpg3vrjbbdd3bgaxej5l6ez3pebn3d5@ytuxhim25j6q>
 <1fd8fd48-9a0a-774c-1366-ea4c893f3b25@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fd8fd48-9a0a-774c-1366-ea4c893f3b25@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 andersson@kernel.org, dianders@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-15 10:46:48, Kuogee Hsieh wrote:
<snip>
> > Friendly request to strip/snip unneeded context (as done in this reply)
> > to make it easier to spot the conversation, and replies to it.
> >
> > - Marijn
> 
> Thanks for suggestion.
> 
> How can I do that?
> 
> just manually delete unneeded context?
> 
> Or are they other way (tricks) to do it automatically?

Fortunately, no: it is up to you to decide what context is relevant,
which is typically the text (and/or diff snippets) you are replying to.

- Marijn

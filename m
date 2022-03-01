Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445ED4CA000
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 09:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C4010EE73;
	Wed,  2 Mar 2022 08:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1248510E6F5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 22:28:21 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2dc0364d2ceso12193067b3.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 14:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9xj8DxbMOY38LuaIk6lXqHpJqveBr5TbPM2cuxHfxy8=;
 b=CRzpu0zbZ4gkobAY1CsEONjv/bkDhYuf+ASRisuXrX18ZTtyOmL8TC2ws6S3xTPrGm
 stcJNNjtKs7u9H3ljpWP6KRT+MiHxRTHBitYC9r66tSeTvrMcQNYzbOE6A4qAv5bZs+3
 0t+TOnmwP9YXyN41Ekeob4j7QieZG37IhKx9KeZGC52ZeJoNZVzO3somcXr/TzTGN4FS
 rLjDpsu8FCjTbN4pKxzkQj4A+UEq5qdvHDFQAOH+U2/3tQBYPv7K5bXohZ6zZB8vB07q
 frqoVVexp986pebShp/oCW2qKRkqgvgqFyEcbD/LyYspM2IyvwSNV/39GOi0skBS5ese
 id3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9xj8DxbMOY38LuaIk6lXqHpJqveBr5TbPM2cuxHfxy8=;
 b=S1Rd2Wn/9JJg0VYBAMx+XM8uOB9oESaOsrb/FzDCkF8bdeZWZXPY6D7gFs8lfAf43Z
 Ab71aIbbUjy66M+FAs/jBZKiD/H5OslkjpAC60Q33OCDsBLXFlpYupC4PiWfgEQOlkqU
 JdIX1HcTiNmzyU1uuP7Zyxp28MTA3yqujo1tlMPtPizwUIb2q+XiFYsIoeR8Zn1jZymW
 qkQzPrysSVsbc0cPWHiIunMPwJzdqL1wvLPtdAAk3x9goRX9hHFsAHGqIP4me/i2BH2w
 SVjUFIMJ1Jt24bZOp3d4gi4dLCmC+JhzqDGof+FRDtYjV2tR/p7/WKO8WR6jscuwShwz
 kwdQ==
X-Gm-Message-State: AOAM532GvSr99/1fEbU1AoX3mQauNt+EiOj003Mw0wzVfcsWDcptYKO7
 2RZnIt0FjgF8YGn3L2EhPmdf9ZL3qmx8eFbA0uY=
X-Google-Smtp-Source: ABdhPJz1m3sDOp9DG+Rza/fvHluR3IQAwd7lXkTK+eRhkR0Zy9qXiUKx6Klbb6RoZ46v4st5cb6ayAN5xjF6YkQuXlY=
X-Received: by 2002:a81:8d1:0:b0:2d0:ebfe:210d with SMTP id
 200-20020a8108d1000000b002d0ebfe210dmr27317121ywi.486.1646173700227; Tue, 01
 Mar 2022 14:28:20 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Przemys=C5=82aw_Drozdowski?= <przemoo9696@gmail.com>
Date: Tue, 1 Mar 2022 23:28:06 +0100
Message-ID: <CAM_zsOuGOBEK6HkZe1m2VLape2rhyCatyzWmpcJuyqE9u3PT2A@mail.gmail.com>
Subject: Re: [PATCH v7,
 04/15] media: mtk-vcodec: Read max resolution from dec_capability
To: nicolas@ndufresne.ca
Content-Type: multipart/alternative; boundary="000000000000a406fc05d92faea1"
X-Mailman-Approved-At: Wed, 02 Mar 2022 08:54:41 +0000
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
Cc: andrew-ct.chen@mediatek.com, dafna.hirschfeld@collabora.com,
 yunfei.dong@mediatek.com, dri-devel@lists.freedesktop.org,
 xiaoyong.lu@mediatek.com, stevecho@chromium.org, irui.wang@mediatek.com,
 george.sun@mediatek.com, benjamin.gaignard@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, frkoenig@chromium.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 tiffany.lin@mediatek.com, Tomasz Figa <tfiga@google.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 acourbot@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a406fc05d92faea1
Content-Type: text/plain; charset="UTF-8"



--000000000000a406fc05d92faea1
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--000000000000a406fc05d92faea1--
